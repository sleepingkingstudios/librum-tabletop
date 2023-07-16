# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "#{Librum::Tabletop::View::PublishersController} routes",
  type: :routing \
do
  include Librum::Core::RSpec::Contracts::RoutingContracts

  include_contract 'should route to view resource',
    'publishers',
    controller: 'librum/tabletop/view/publishers',
    only:       %i[index show]
end
