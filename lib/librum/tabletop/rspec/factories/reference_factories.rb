# frozen_string_literal: true

require 'librum/core/rspec/factories/shared_factories'

module Librum::Tabletop::RSpec::Factories
  # Shared RSpec factories for Reference models.
  module ReferenceFactories
    extend Librum::Core::RSpec::Factories::SharedFactories

    factory :reference,
      class:   'Librum::Tabletop::Reference',
      aliases: %i[librum_tabletop_reference] \
    do
      id { SecureRandom.uuid }

      transient do
        sequence(:reference_index) { |index| index }
      end

      name { "Reference #{reference_index}" }
      slug { name.tr(' ', '_').underscore.tr('_', '-') }

      trait :with_source do
        # :nocov:
        source do
          association :source,
            :with_game_system,
            :with_publisher,
            factory: :book
        end
        # :nocov:

        source_metadata { source.metadata }
      end
    end
  end
end
