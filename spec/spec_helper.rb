# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../demo/config/environment', __dir__)

require 'pry'
require 'rspec/rails'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.include ViewComponent::TestHelpers, type: :view_component

  config.define_derived_metadata(file_path: %r{/spec/components}) do |metadata|
    metadata[:type] = :view_component
  end

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
