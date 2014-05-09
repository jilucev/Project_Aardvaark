require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'font_awesome/sass'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)



module Aardvaark
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  end

   # config.action_mailer.default_url_options = { :host =>
   # 'www.yourhostnamehere.com' }

   # config.action_mailer.delivery_method = :aardvaark_delivery


# Aardvaark::Application.configure do
#   config.action_mailer.smtp_settings = {
#     :address   => "smtp.mandrillapp.com",
#     :port      => 587,
#     :enable_starttls_auto => true,
#     :user_name => "romanchukenator@gmail.com",
#     :password  => "S2kxvXEMlDNK7oFZkul-mg", # SMTP password is any valid API key
#     :authentication => 'login', # Mandrill supports 'plain' or 'login'
#     :domain => 'aDvK.com', # your domain to identify your server when connecting
#   }
# end  
end
