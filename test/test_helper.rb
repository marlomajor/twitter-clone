require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  VCR.configure do |config|
    config.cassette_library_dir = "test/cassettes"
    config.hook_into :webmock
  end

end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = TwitterClone::Application
    stub_omniauth
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      extra: {
        raw_info: {
          user_id: "1234",
          name: "Marlo",
          screen_name: "marlomajor",
        }
      },
      credentials: {
        token: "pizza",
        secret: "secretpizza"
      }
    })
  end
end
