# frozen_string_literal: true

module Librum::Tabletop::RSpec::Factories
  # Shared RSpec factories for GameSetting models.
  module GameSettingFactories
    extend Librum::Core::RSpec::Factories::SharedFactories

    factory :game_setting,
      class:   'Librum::Tabletop::GameSetting',
      aliases: %i[librum_tabletop_game_setting] \
    do
      id { SecureRandom.uuid }

      transient do
        sequence(:setting_index) { |index| index }
      end

      name { "Game Setting #{setting_index}" }
      slug { name.tr(' ', '_').underscore.tr('_', '-') }

      trait :with_publisher do
        publisher { association :publisher }
      end
    end
  end
end
