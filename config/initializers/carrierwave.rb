require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
    CarrierWave.configure do |config|
      config.fog_credentials = {
        # Amazon S3用の設定
        :provider              => 'AWS',
        :region                => 'ap-northeast-1',  # S3に設定したリージョン。
        :aws_access_key_id     => ENV['ACCESS_KEY_ID'],
        :aws_secret_access_key => ENV['SECRET_ACCESS_KEY']
      }
      config.fog_directory     =  'meshigatya'
    end
end