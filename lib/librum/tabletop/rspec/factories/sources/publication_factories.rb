# frozen_string_literal: true

require 'librum/core/rspec/factories/shared_factories'

module Librum::Tabletop::RSpec::Factories::Sources
  # Shared RSpec factories for Sources::Publication models.
  module PublicationFactories
    extend Librum::Core::RSpec::Factories::SharedFactories

    factory :publication,
      class:   'Librum::Tabletop::Sources::Publication',
      aliases: %i[librum_tabletop_sources_publication],
      parent:  :source \
    do
      transient do
        sequence(:publication_index) { |index| index }
      end

      name { "Publication #{source_index}" }
      slug { name.tr(' ', '_').underscore.tr('_', '-') }

      official { true }
      playtest { false }

      trait :with_game_setting do
        # :nocov:
        game_setting do
          association :game_setting,
            publisher: (publisher || create(:publisher))
        end
        # :nocov:
      end

      trait :with_game_system do
        # :nocov:
        game_system do
          association :game_system,
            publisher: (publisher || create(:publisher))
        end
        # :nocov:
      end

      trait :with_publisher do
        association :publisher
      end
    end
  end
end
