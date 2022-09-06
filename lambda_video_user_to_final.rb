require 'json'
require 'aws-sdk-s3'
require 'logger'
require 'open3'

def lambda_handler(event:, context:)
  s3 = Aws::S3::Client.new
  bucket = event['Records'][0]['s3']['bucket']['name']
  @key = event['Records'][0]['s3']['object']['key']

  logger.info("Start to edit user_video for s3://final-videos-s3-01/#{@key}")

  basename_final = "final_" + File.basename(@key)
  signer = Aws::S3::Presigner.new
  user_video_url = signer.presigned_url(:get_object, bucket: bucket, key: @key)
  content_video_url = get_content_video
  puts user_video_url
  puts content_video_url 

  # 後述する AWS Lambda Layer を使用して、FFmpegを Lambda 環境にインストールしているので、
  # 'opt/'以下に格納されたffmpegの実行ファイルを使用する
  # ffmpeg -i アップロードされたユーザー動画 -i コンテンツ動画 -filter_complex "video連結aduioなし" -an final_ユーザー動画（として出力）
  ffmpeg_cmd = "/opt/bin/ffmpeg -i #{user_video_url}  -i #{content_video_url} -filter_complex "concat=n=2 : v=1 : a=0" -an #{basename_final}.mp4"
  log_output, error, status = Open3.capture3(ffmpeg_cmd)

  logger.info("edit video is completed")
  logger.info(log_output)
  logger.info(status)

  unless status.success?
    logger.error(error)
    raise
  end

  s3.put_object({
    acl: 'public-read',
    body: File.open("/#{basename_final}.mp4"),
    bucket:  "final-videos-s3-01",
    key: "#{basename_final}.mp4",
    content_type: 'mp4'
  })

  logger.info("Upload is completed!")
rescue => e
  logger.error("#{e.class}:#{e.message}")
  raise e
end

private

def get_content_video
  bucket = "content-videos-s3-01"
  #ユーザー動画のファイル名
  user_video = @key
  #コンテンツ動画の番号を切り取り取得
  content_number = user_video.slice(0,3)
  key = "#{content_number}_content.mp4"
  signer = Aws::S3::Presigner.new
  @content_video_url = signer.presigned_url(:get_object, bucket: bucket, key: key)
  @content_video_url
end

def logger
  @logger ||= Logger.new(STDOUT)
end
