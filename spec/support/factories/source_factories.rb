# frozen_string_literal: true

FactoryBot.define do
  factory :source, class: 'Librum::Tabletop::Source' do
    id { SecureRandom.uuid }

    transient do
      sequence(:source_index) { |index| index }
    end

    name { "Source #{source_index}" }
    slug { name.tr(' ', '_').underscore.tr('_', '-') }
  end
end
