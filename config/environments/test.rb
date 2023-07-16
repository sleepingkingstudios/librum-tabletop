# frozen_string_literal: true

Rails.application.configure do
  # Eager loading loads your whole application. When running a single test locally,
  # this probably isn't necessary. It's a good idea to do in a continuous integration
  # system, or in some way before deploying your code.
  config.eager_load = ENV['CI'].present?

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  config.factory_bot.definition_file_paths = ['spec/support/factories']

  # Configure view controllers.
  config.base_url = '/tabletop'

  config.page_breadcrumbs = [
    {
      label: 'Home',
      url:   '/'
    }.freeze,
    {
      label: 'Tabletop',
      url:   '/tabletop'
    }.freeze
  ].freeze

  config.page_navigation = {
    icon:  'circle-radiation',
    label: 'Home'
  }.freeze

  # Configure user model.
  config.user_model = 'Spec::Support::User'
end
