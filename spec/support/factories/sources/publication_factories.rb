# frozen_string_literal: true

FactoryBot.define do
  factory :publication,
    class:  'Librum::Tabletop::Sources::Publication',
    parent: :source \
  do
    transient do
      sequence(:publication_index) { |index| index }
    end

    name { "Publication #{source_index}" }
    slug { name.tr(' ', '_').underscore.tr('_', '-') }

    official { true }
    playtest { false }

    trait :with_game_setting do
      association :game_setting, publisher: (publisher || create(:publisher))
    end

    trait :with_game_system do
      association :game_system, publisher: (publisher || create(:publisher))
    end

    trait :with_publisher do
      association :publisher
    end
  end
end
