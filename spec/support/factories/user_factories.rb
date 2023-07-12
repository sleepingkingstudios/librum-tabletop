# frozen_string_literal: true

require 'support/user'

FactoryBot.define do
  factory :user,
    class:  'Spec::Support::User',
    parent: :source \
  do
    id { SecureRandom.uuid }

    transient do
      sequence(:user_index) { |index| index }
    end

    name { "User #{user_index}" }
    slug { name.tr(' ', '_').underscore.tr('_', '-') }

    trait :with_homebrew do
      after(:create) do |user|
        # :nocov:
        create(:homebrew_source, user: user)
        # :nocov:
      end
    end
  end
end
