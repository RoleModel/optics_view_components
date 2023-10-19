# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../demo/config/environment', __dir__)

require 'pry'
require 'rspec/rails'
require 'simplecov'
require 'simplecov-lcov'
SimpleCov::Formatter::LcovFormatter.config.report_with_single_file = true
SimpleCov.start do
  formatter SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::LcovFormatter,
    SimpleCov::Formatter::SimpleFormatter,
    SimpleCov::Formatter::HTMLFormatter,
  ])
  add_filter(%r{^/spec/}) # For RSpec
  add_filter(%r{^/config/}) # Skip config files
  enable_coverage(:branch) # Report branch coverage to trigger branch-level undercover warnings
end

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
