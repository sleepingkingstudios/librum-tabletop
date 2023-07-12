# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Librum::Tabletop::Sources::Publication do
  include Librum::Tabletop::RSpec::Contracts::Models::SourceContracts

  subject(:publication) { described_class.new(attributes) }

  let(:attributes) do
    {
      name: 'Example Publication',
      slug: 'example-publication',
      data: {
        'official' => true,
        'playtest' => true
      }
    }
  end

  include_contract 'should be a publication',
    type: 'Librum::Tabletop::Sources::Publication'
end
