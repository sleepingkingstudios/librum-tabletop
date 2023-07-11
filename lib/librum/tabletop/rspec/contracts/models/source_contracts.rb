# frozen_string_literal: true

require 'rspec/sleeping_king_studios/contract'

require 'librum/core/rspec/contracts/model_contracts'
require 'librum/core/rspec/contracts/models/data_properties_contracts'

module Librum::Tabletop::RSpec::Contracts::Models
  # Contracts asserting on the behavior of source models.
  module SourceContracts
    include Librum::Core::RSpec::Contracts::ModelContracts
    include Librum::Core::RSpec::Contracts::Models::DataPropertiesContracts

    # Asserts that the model matches the expected source methods.
    module ShouldBeASourceContract
      extend RSpec::SleepingKingStudios::Contract

      contract do |type:, **options|
        options[:game_system_ids] ||= Array.new(2) { SecureRandom.uuid }
        options[:publisher_ids]   ||= Array.new(2) { SecureRandom.uuid }

        include_contract 'should be a model'

        ### Attributes
        include_contract 'should define attribute',
          :name,
          default: ''
        include_contract 'should define attribute',
          :slug,
          default: ''
        include_contract 'should define attribute',
          :data,
          default: {}
        include_contract 'should define attribute',
          :game_setting_id,
          value: nil
        include_contract 'should define attribute',
          :publisher_id,
          value: nil
        include_contract 'should define attribute',
          :user_id,
          value: nil

        include_contract 'should define data properties'

        describe '#homebrew?' do
          include_examples 'should define predicate', :homebrew?
        end

        describe '#legacy?' do
          include_examples 'should define predicate', :legacy?
        end

        describe '#metadata' do
          let(:expected) do
            {
              'homebrew' => subject.homebrew?,
              'legacy'   => subject.legacy?,
              'official' => subject.official?,
              'playtest' => subject.playtest?
            }
          end

          include_examples 'should define reader',
            :metadata,
            -> { be >= expected }
        end

        describe '#official?' do
          include_examples 'should define predicate', :official?
        end

        describe '#playtest?' do
          include_examples 'should define predicate', :playtest?
        end

        describe '#type' do
          include_examples 'should define reader', :type, type
        end

        describe '#valid?' do
          include_contract 'should validate the presence of',
            :name,
            type: String

          include_contract 'should validate the presence of',
            :slug,
            type: String

          include_contract 'should validate the format of',
            :slug,
            message:     'must be in kebab-case',
            matching:    {
              'example'               => 'a lowercase string',
              'example-slug'          => 'a kebab-case string',
              'example-compound-slug' => # rubocop:disable Layout/HashAlignment
                'a kebab-case string with multiple words',
              '1st-example'           => 'a kebab-case string with digits'
            },
            nonmatching: {
              'InvalidSlug'   => 'a string with capital letters',
              'invalid slug'  => 'a string with whitespace',
              'invalid_slug'  => 'a string with underscores',
              '-invalid-slug' => 'a string with leading dash',
              'invalid-slug-' => 'a string with trailing dash'
            }
        end
      end
    end
  end
end
