# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Librum::Tabletop::HomebrewUser, type: :model do
  include Librum::Core::RSpec::Contracts::ModelContracts

  subject(:user) { described_class.new(attributes) }

  let(:described_class) { Spec::Support::User }
  let(:attributes) do
    {
      name: 'Alan Bradley',
      slug: 'alan-bradley'
    }
  end

  ## Associations
  include_contract 'should have one',
    :homebrew_source,
    factory_name: :homebrew,
    inverse_name: :user
end
