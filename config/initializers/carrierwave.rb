# config/initializers/carrierwave.rb

# Configure to use local file system for Development
if Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
  end
end

# Configure to use Amazon AWS for Production
if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        :provider               => 'AWS',
        :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],
        :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
        :region                 => 'us-west-1' # Change this for different AWS region. Default is 'us-east-1'
    }
    config.fog_directory  = "justix" # Bucket
  end
end