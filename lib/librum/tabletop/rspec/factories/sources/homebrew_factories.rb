# frozen_string_literal: true

module Librum::Tabletop::RSpec::Factories::Sources
  # Shared RSpec factories for Sources::Homebrew models.
  module HomebrewFactories
    extend Librum::Core::RSpec::Factories::SharedFactories

    factory :homebrew,
      class:   'Librum::Tabletop::Sources::Homebrew',
      aliases: %i[librum_tabletop_sources_homebrew],
      parent:  :source \
    do
      transient do
        mock_user { build(:user) }
      end

      name { "User: #{(user || mock_user).username}" }
      slug { name.tr(' ', '_').underscore.tr('_', '-').gsub(/[^A-Za-z-]+/, '') }

      trait :with_user do
        user { association :user }
      end
    end
  end
end
