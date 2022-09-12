import json
import urllib.parse
import boto3
import os

S3_DESTINATION_BUCKET = "completed-videos-s3-01"
mediaconvert =  boto3.client('mediaconvert', region_name='ap-northeast-1', endpoint_url='https://mpazqbhuc.mediaconvert.ap-northeast-1.amazonaws.com')

def lambda_handler(event, context):

    s3_source_bucket = event['Records'][0]['s3']['bucket']['name']
    s3_source_key = event['Records'][0]['s3']['object']['key']
    #ユーザー動画の先頭３文字はコンテンツ番号が振ってあるので、切り取ってcontent_numberとして扱う。
    s3_source_basename = os.path.splitext(os.path.basename(s3_source_key))[0]
    content_number = s3_source_basename.split('_')[0]
    print (content_number)
    # content-videos-s3-01に保存してあるコンテンツ動画のファイル名を作成
    s3_content_key = content_number + "_content.mp4"
    #s3_destination_filename = "final_" + s3_source_basename + ".mp4"

    #URLエンコードされた値を元に戻す
    s3_user_key = urllib.parse.unquote_plus(event['Records'][0]['s3']['object']['key'], encoding='utf-8')
    inputFile_user = "s3://" + "user-videos-s3-01" + "/" + s3_source_key
    inputFile_content = "s3://" + "content-videos-s3-01" + "/" + s3_content_key  
    #outputKey = "s3://completed-videos-s3-01/" + s3_destination_filename

    #try:
    s3_client = boto3.client('s3')
    response = s3_client.get_object(Bucket="connect-user-content",Key="connect_user_content.json")
    body = response['Body'].read()
    job_object = json.loads(body.decode('utf-8'))
    print (job_object)
    # Load job.json from disk and store as Python object: job_object
    # job.jsonというファイルを読み取りモードで開き、
    #with open("response", "r") as jsonfile:  
        #job_object = json.load(jsonfile)
        
    # Input/Output Setting
    job_object["Inputs"][0]["FileInput"] = inputFile_user
    job_object["Inputs"][1]["FileInput"] = inputFile_content
    
    # Exec MediaConvert's job
    response = mediaconvert.create_job(        
        Queue='arn:aws:mediaconvert:ap-northeast-1:992946812485:queues/Default',
        Role='arn:aws:iam::992946812485:role/video_upload_download_lambda_role',
        Priority = 0,
        StatusUpdateInterval = 'SECONDS_60',
        AccelerationSettings = {"Mode": "DISABLED"},
        Settings=job_object
    )
    #except Exception as e:
        #print(e)
        #print('Error getting object {} from bucket {}. Make sure they exist and your bucket is in the same region as this function.'.format(key, bucket))
        #raise e