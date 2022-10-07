# CarrierWave.configure do |config|
#     config.fog_credentials = {
#         provider: 'AWS',
#         aws_access_key_id: "AKIAU3OKE2CYILL6QSE2",
#         aws_secret_access_key: "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"
#     }
#     config.storage = :fog
#     config.permissions = 0666
#     config.cache_dir = "#{Rails.root}/tmp/"
#     config.fog_directory = "my-new-bucket-shubham123"
#     config.fog_public = false
#     config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }     #optional
# end