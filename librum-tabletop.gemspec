# frozen_string_literal: true

require_relative 'lib/librum/tabletop/version'

Gem::Specification.new do |gem|
  gem.name        = 'librum-tabletop'
  gem.version     = Librum::Tabletop::VERSION
  gem.summary     =
    'Librum engine defining shared functionality for tabletop game systems.'

  description = <<~DESCRIPTION
    The tabletop engine for the Librum application framework. Defines shared
    functionality for tabletop game systems, such as publishers, sources and
    references.
  DESCRIPTION
  gem.description = description.strip.gsub(/\n +/, ' ')
  gem.authors     = ['Rob "Merlin" Smith']
  gem.email       = ['merlin@sleepingkingstudios.com']
  gem.homepage    = 'http://sleepingkingstudios.com'
  gem.license     = 'GPL-3.0-only'

  gem.metadata = {
    'allowed_push_host'     => 'none',
    'bug_tracker_uri'       => 'https://github.com/sleepingkingstudios/librum-tabletop/issues',
    'homepage_url'          => gem.homepage,
    'source_code_uri'       => 'https://github.com/sleepingkingstudios/librum-tabletop',
    'rubygems_mfa_required' => 'true'
  }

  gem.required_ruby_version = '>= 3.0.0'
  gem.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir[
      '{app}/**/*',
      'config/routes.rb',
      'db/migrate/**/*',
      'lib/librum/**/*',
      'LICENSE.md',
      'README.md'
    ]
  end

  gem.add_dependency 'pg',    '~> 1.5'
  gem.add_dependency 'rails', '~> 7.0.6'
end
