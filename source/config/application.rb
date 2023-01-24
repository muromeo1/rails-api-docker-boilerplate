require_relative 'boot'

require 'rails'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'

Bundler.require(*Rails.groups)

module Source
  class Application < Rails::Application
    config.load_defaults 7.0
    config.log_level = :debug
    config.log_tags  = %i[subdomain uuid]
    config.logger    = ActiveSupport::TaggedLogging.new(Logger.new($stdout))
    config.api_only  = true

    config.generators do |gen|
      gen.system_tests = nil
      gen.test_framework = :rspec
    end
  end
end
