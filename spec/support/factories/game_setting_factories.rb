# frozen_string_literal: true

FactoryBot.define do
  factory :game_setting, class: 'Librum::Tabletop::GameSetting' do
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
