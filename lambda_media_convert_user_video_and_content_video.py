import json
import urllib.parse
import boto3
import os

USER_BACKET = "user-videos-s3-01"
CONTENTS_BACKET = "content-videos-s3-01"

mediaconvert =  boto3.client('mediaconvert', region_name='ap-northeast-1', endpoint_url='https://mpazqbhuc.mediaconvert.ap-northeast-1.amazonaws.com')

def lambda_handler(event, context):
    #アップロードされたユーザー動画のファイル名を取り出す。
    s3_source_key = event['Records'][0]['s3']['object']['key']
    #ユーザー動画のファイル名の先頭３文字はコンテンツ番号が振ってあるので、切り取ってcontent_numberとして扱う。
    s3_source_basename = os.path.splitext(os.path.basename(s3_source_key))[0]
    content_number = s3_source_basename.split('_')[0]
    # 結合させたいコンテンツ動画のファイル名を作成
    s3_content_key = content_number + "_content.mp4"

    #MediaConvertの指示書に書き込むために、ユーザー投稿動画と結合させたいコンテンツ動画の保管場所URLを作成
    inputFile_user = "s3://" + USER_BACKET + "/" + s3_source_key
    inputFile_content = "s3://" + CONTENTS_BACKET + "/" + s3_content_key

    s3_client = boto3.client('s3')
    # S3に保管しておいた、MediaConvertに送る指示書であるconnect_user_content.jsonというファイルを開く。
    response = s3_client.get_object(Bucket="connect-user-content",Key="connect_user_content.json")
    body = response['Body'].read()
    # 対象となるユーザー投稿動画とコンテンツ動画を指示書に書き込む。
    job_object = json.loads(body.decode('utf-8'))
    job_object["Inputs"][0]["FileInput"] = inputFile_user
    job_object["Inputs"][1]["FileInput"] = inputFile_content

    #作った指示書を添えて、mediaConvertに作成指示を送る。※作成権限を持ったロールも付与
    response = mediaconvert.create_job(
        Queue='arn:aws:mediaconvert:ap-northeast-1:992946812485:queues/Default',
        Role='arn:aws:iam::992946812485:role/video_upload_download_lambda_role',
        Priority = 0,
        StatusUpdateInterval = 'SECONDS_60',
        AccelerationSettings = {"Mode": "DISABLED"},
        Settings=job_object
    )