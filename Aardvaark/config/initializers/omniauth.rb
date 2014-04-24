Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['iQKX1P24Zj5DYb19wvRxcozNi'], ENV['CONSUMER_SECRET']
end