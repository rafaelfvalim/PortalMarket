require File.expand_path('../boot', __FILE__)
# chat
require 'rails/all'
require 'net/http'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CodeStore
  class Application < Rails::Application

    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_record.default_timezone = :utc

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'UTC'
    #http://stackoverflow.com/questions/33648457/why-created-at-wrong-time-when-saved-to-database


    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = 'pt-BR'

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    #Custom configs for Klustter Portal - Code Store
    config.jar_encrypt = 'GeraScript.jar'
    config.jar_token = 'DummyToken.jar'
    config.jar_license = 'GeraKey.jar'
    config.jars_path = "#{Rails.public_path}/jars/"
    config.downloads_path = "#{Rails.public_path}/downloads/"
    config.uploads_path = "#{Rails.public_path}/uploads/"
    config.download_url_days_expires = 60
    config.absolute_site_url = 'http://191.241.240.51/'
    config.adm_server = 'http://10.11.50.154:10000'
    config.mailcatcher = 'http://localhost:1080'
    config.elasticsearch = 'http://localhost:9200/_plugin/HQ/'
    config.webservice_generate_file = 'http://localhost:8080/KlustterService/services/ServiceScriptWeb?wsdl'
    config.webservice_generate_key = 'http://localhost:8080/KlustterService/services/ServiceScriptWeb?wsdl'
    config.webservice_user_token = 'http://localhost:8080/KlustterService/services/ServiceUserWeb?wsdl'
    # load models into subfolders
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '*/')]
  end
end
