# frozen_string_literal: true

FactoryBot.define do
  factory :homebrew,
    class:  'Librum::Tabletop::Sources::Homebrew',
    parent: :source \
  do
    transient do
      mock_user { build(:user) } # rubocop:disable FactoryBot/FactoryAssociationWithStrategy
    end

    name { "User: #{(user || mock_user).username}" }
    slug { name.tr(' ', '_').underscore.tr('_', '-').gsub(/[^A-Za-z-]+/, '') }

    trait :with_user do
      user { association :user }
    end
  end
end
