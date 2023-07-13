# frozen_string_literal: true

FactoryBot.define do
  factory :reference, class: 'Librum::Tabletop::Reference' do
    id { SecureRandom.uuid }

    transient do
      sequence(:reference_index) { |index| index }
    end

    name { "Reference #{reference_index}" }
    slug { "reference-#{reference_index}" }

    trait :with_source do
      # :nocov:
      source do
        association :source, :with_game_system, :with_publisher, factory: :book
      end
      # :nocov:

      source_metadata { source.metadata }
    end
  end

  factory :generic_reference,
    class:  'Spec::Support::GenericReference',
    parent: :reference \
  do
    details { 'Zzzzz...' }
  end
end
