# frozen_string_literal: true

module Librum::Tabletop::RSpec
  # Namespace for shared FactoryBot factory definitions.
  module Factories
    FACTORY_DEFINITIONS = %w[
      GameSetting
      GameSystem
      Publisher
      Reference
      Source
      Sources::Publication
      Sources::Homebrew
      Sources::Book
      Sources::Website
    ].freeze
    private_constant :FACTORY_DEFINITIONS

    def self.define_factories
      FACTORY_DEFINITIONS.each do |name|
        definition = const_get("#{name}Factories")

        definition.define_factories
      end
    end
  end
end
