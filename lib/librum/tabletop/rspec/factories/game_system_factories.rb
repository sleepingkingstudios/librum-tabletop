# frozen_string_literal: true

require 'librum/core/rspec/factories/shared_factories'

module Librum::Tabletop::RSpec::Factories
  # Shared RSpec factories for GameSystem models.
  module GameSystemFactories
    extend Librum::Core::RSpec::Factories::SharedFactories

    factory :game_system,
      class:   'Librum::Tabletop::GameSystem',
      aliases: %i[librum_tabletop_game_system] \
    do
      id { SecureRandom.uuid }

      transient do
        sequence(:game_system_index) { |index| index }
      end

      name { "Game System #{game_system_index}" }
      slug { name.tr(' ', '_').underscore.tr('_', '-') }

      trait :with_publisher do
        publisher { association :publisher }
      end
    end
  end
end
