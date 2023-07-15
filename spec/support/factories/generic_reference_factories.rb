# frozen_string_literal: true

FactoryBot.define do
  factory :generic_reference,
    class:  'Spec::Support::GenericReference',
    parent: :reference \
  do
    details { 'Zzzzz...' }
  end
end
