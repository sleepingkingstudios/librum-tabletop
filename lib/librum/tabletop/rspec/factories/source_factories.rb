# frozen_string_literal: true

module Librum::Tabletop::RSpec::Factories
  # Shared RSpec factories for Source models.
  module SourceFactories
    extend Librum::Core::RSpec::Factories::SharedFactories

    factory :source,
      class:   'Librum::Tabletop::Source',
      aliases: %i[librum_tabletop_source] \
    do
      id { SecureRandom.uuid }

      transient do
        sequence(:source_index) { |index| index }
      end

      name { "Source #{source_index}" }
      slug { name.tr(' ', '_').underscore.tr('_', '-') }
    end
  end
end
