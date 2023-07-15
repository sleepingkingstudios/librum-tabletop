# frozen_string_literal: true

require 'librum/core/rspec/factories/shared_factories'

module Librum::Tabletop::RSpec::Factories
  # Shared RSpec factories for Publisher models.
  module PublisherFactories
    extend Librum::Core::RSpec::Factories::SharedFactories

    factory :publisher,
      class:   'Librum::Tabletop::Publisher',
      aliases: %i[librum_tabletop_publisher] \
    do
      id { SecureRandom.uuid }

      transient do
        sequence(:publisher_index) { |index| index }
      end

      name { "Publisher #{publisher_index}" }
      slug { name.tr(' ', '_').underscore.tr('_', '-') }
    end
  end
end
