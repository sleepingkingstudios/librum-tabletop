# frozen_string_literal: true

FactoryBot.define do
  factory :game_system, class: 'Librum::Tabletop::GameSystem' do
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
