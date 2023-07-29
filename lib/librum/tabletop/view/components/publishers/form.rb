# frozen_string_literal: true

module Librum::Tabletop::View::Components::Publishers
  # Renders a form for a publisher record.
  class Form < Librum::Core::View::Components::Resources::Form
    private

    def default_data
      { 'publisher' => Librum::Tabletop::Publisher.new }
    end
  end
end
