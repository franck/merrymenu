require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  ENV["RAILS_ENV"] = "test"
  require File.expand_path("../../config/environment", __FILE__)
  require "minitest/autorun"
  require "capybara/rails"
  require "active_support/testing/setup_and_teardown"
  require 'database_cleaner'

  class IntegrationTest < MiniTest::Spec
    include Rails.application.routes.url_helpers
    include Capybara::DSL
    register_spec_type(/integration$/, self)
  end

  class HelperTest < MiniTest::Spec
    include ActiveSupport::Testing::SetupAndTeardown
    include ActionView::TestCase::Behavior
    register_spec_type(/Helper$/, self)
  end

  # :dot, :outline, :progress
  Turn.config.format = :dot

  # Require ruby files in support dir.
  Dir[File.expand_path('test/support/*.rb')].each { |file| require file }

  DatabaseCleaner.strategy = :truncation
  class MiniTest::Spec
    before :each do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
  FactoryGirl.reload
end


