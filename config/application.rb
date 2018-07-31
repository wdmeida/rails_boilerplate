require_relative 'boot'

require 'rails'

require 'active_model/railtie'
require 'active_job/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'

Bundler.require(*Rails.groups)

module RailsBoilerplate
  class Application < Rails::Application
    config.load_defaults 5.2

    config.i18n.default_locale = :'pt-BR'
    config.time_zone = 'Brasilia'

    config.api_only = true

    config.generators do |g|
      g.orm :mongoid
      g.factory_bot false
    end
  end
end
