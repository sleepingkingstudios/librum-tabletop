# frozen_string_literal: true

module Librum::Tabletop::RSpec::Factories::Sources
  # Shared RSpec factories for Sources::Website models.
  module WebsiteFactories
    extend Librum::Core::RSpec::Factories::SharedFactories

    factory :website,
      class:   'Librum::Tabletop::Sources::Website',
      aliases: %i[librum_tabletop_sources_website],
      parent:  :publication \
    do
      transient do
        sequence(:website_index) { |index| index }
      end

      name { "Website #{website_index}" }
      slug { name.tr(' ', '_').underscore.tr('_', '-') }

      base_url { 'www.example.com' }
    end
  end
end
