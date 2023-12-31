# frozen_string_literal: true

require 'rails_helper'

require 'support/generic_reference'

RSpec.describe Spec::Support::GenericReference, type: :model do # rubocop:disable RSpec/FilePath
  include Librum::Tabletop::RSpec::Contracts::Models::ReferenceContracts

  subject(:reference) { described_class.new(attributes) }

  let(:attributes) do
    {
      name:    'Example Reference',
      slug:    'example-reference',
      stub:    false,
      details: 'So boring, you suspect it may have anti-memetic powers.'
    }
  end

  include_contract 'should be a reference',
    factory_name: :generic_reference,
    type:         nil

  include_contract 'should define attribute', :details

  describe '#valid?' do
    include_contract 'should validate the presence of',
      :details,
      type: String

    context 'when the reference is stubbed' do
      let(:attributes) { super().merge(stub: true) }

      describe 'should not validate the details' do
        let(:attributes) { super().merge(details: nil) }

        it { expect(reference).not_to have_errors.on(:details) }
      end
    end
  end
end
