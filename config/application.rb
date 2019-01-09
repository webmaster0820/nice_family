require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module goldtime
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.i18n.default_locale = :'nb'
		config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')
		config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/

    config.action_mailer.default_url_options = { host: "vehiclecsv.herokuapp.com" }

    ActionMailer::Base.smtp_settings = {
      address: "send.one.com",
      domain: "jonaspreisler.com",
      port: 587,
      user_name: "bestdealerchat@jonaspreisler.com", #ENV["GMAIL_USERNAME"]
      password: "password", #ENV["GMAIL_PASSWORD"]
      authentication: :login,
      enable_starttls_auto: true
    }

    config.autoload_paths += %w(#{config.root}/app/models/ckeditor)

    config.exceptions_app = self.routes


  end
end
