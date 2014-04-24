# OmniAuth.config.logger = Rails.logger

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :twitter, ENV['anFG1PQkqzOzen9NloKVCJrun'], ENV['OQStg9lr1NHSkhM4wJ1PhPoLMmgoEy8cRqfN7xJhiqYCYjedGB']
# end


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'anFG1PQkqzOzen9NloKVCJrun', 'OQStg9lr1NHSkhM4wJ1PhPoLMmgoEy8cRqfN7xJhiqYCYjedGB'
end