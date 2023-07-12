# frozen_string_literal: true

FactoryBot.define do
  factory :website,
    class:  'Librum::Tabletop::Sources::Website',
    parent: :publication \
  do
    transient do
      sequence(:website_index) { |index| index }
    end

    name { "Website #{website_index}" }
    slug { name.tr(' ', '_').underscore.tr('_', '-') }

    base_url { 'www.example.com' }
  end
end
