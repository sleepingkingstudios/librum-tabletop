# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Librum::Tabletop::ViewController, type: :controller do
  include Librum::Core::RSpec::Contracts::ControllerContracts

  describe '.default_format' do
    it { expect(described_class.default_format).to be :html }
  end

  describe '.middleware' do
    include_contract 'should define middleware',
      lambda {
        be_a(Librum::Core::Actions::View::Middleware::PageNavigation)
          .and have_attributes(
            navigation: Librum::Tabletop::Engine.config.page_navigation
          )
      }
  end

  describe '.responders' do
    include_contract 'should respond to format',
      :html,
      using: Librum::Core::Responders::Html::ViewResponder

    include_contract 'should not respond to format', :json
  end
end
