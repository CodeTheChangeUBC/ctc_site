if (Rails.env.production? || Rails.env.development?)
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AWS_ACCESS_KEY'],
      :aws_secret_access_key => ENV['AWS_SECRET_KEY'],
      :region                => 'us-west-2'
    }
    config.fog_directory     =  ENV['AWS_BUCKET']
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end
end
