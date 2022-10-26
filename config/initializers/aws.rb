Aws.config.update({
    region: 'ap-northeast-1',
    credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
    })
    s3 = Aws::S3::Client.new(signature_version: 'v4')
    Signer = Aws::S3::Presigner.new(client: s3)
