# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Librum::Tabletop::View::PublishersController,
  type: :controller \
do
  include Librum::Core::RSpec::Contracts::ControllerContracts

  let(:base_url) { Librum::Tabletop::Engine.config.base_url }

  describe '.breadcrumbs' do
    let(:expected) do
      [
        *Librum::Tabletop::Engine.config.page_breadcrumbs,
        {
          label: 'Publishers',
          url:   "#{base_url}/publishers"
        }
      ]
    end

    it 'should define the class reader' do
      expect(described_class)
        .to define_reader(:breadcrumbs)
        .with_value(expected)
    end
  end

  describe '.middleware' do
    include_contract 'should define middleware', lambda {
      be_a(Librum::Core::Actions::View::Middleware::ResourceBreadcrumbs)
        .and have_attributes(breadcrumbs: described_class.breadcrumbs)
    }
  end

  describe '.resource' do
    subject(:resource) { described_class.resource }

    let(:permitted_attributes) do
      %w[
        name
        slug
        website
      ]
    end

    it { expect(resource).to be_a Librum::Core::Resources::ViewResource }

    it { expect(resource.base_path).to be == "#{base_url}/publishers" }

    it { expect(resource.default_order).to be :name }

    it { expect(resource.permitted_attributes).to be == permitted_attributes }

    it { expect(resource.resource_class).to be == Librum::Tabletop::Publisher }

    it { expect(resource.resource_name).to be == 'publishers' }

    it 'should define the block component' do
      expect(resource.block_component)
        .to be Librum::Tabletop::View::Components::Publishers::Block
    end

    it 'should define the form component' do
      expect(resource.form_component)
        .to be Librum::Tabletop::View::Components::Publishers::Form
    end

    it 'should define the table component' do
      expect(resource.table_component)
        .to be Librum::Tabletop::View::Components::Publishers::Table
    end
  end

  describe '.responders' do
    include_contract 'should respond to format',
      :html,
      using: Librum::Core::Responders::Html::ResourceResponder

    include_contract 'should not respond to format', :json
  end

  include_contract 'should define action',
    :create,
    Librum::Core::Actions::Create,
    member: false

  include_contract 'should define action',
    :destroy,
    Librum::Core::Actions::Destroy,
    member: true

  include_contract 'should define action',
    :edit,
    Librum::Core::Actions::Show,
    member: true

  include_contract 'should define action',
    :index,
    Librum::Core::Actions::Index,
    member: false

  include_contract 'should define action',
    :new,
    Cuprum::Rails::Action,
    member: false

  include_contract 'should define action',
    :show,
    Librum::Core::Actions::Show,
    member: true

  include_contract 'should define action',
    :update,
    Librum::Core::Actions::Update,
    member: true
end
