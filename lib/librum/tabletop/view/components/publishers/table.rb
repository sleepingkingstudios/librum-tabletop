# frozen_string_literal: true

module Librum::Tabletop::View::Components::Publishers
  # Renders a table of Publisher records.
  class Table < Librum::Core::View::Components::Resources::Table
    COLUMNS_FOR = lambda { |resource| # rubocop:disable Metrics/BlockLength
      [
        {
          key:   'name',
          value: lambda { |item|
            Librum::Core::View::Components::Link.new(
              "/core/publishers/#{item.slug}",
              label: item.name
            )
          }
        }.freeze,
        {
          key:     'website',
          type:    :link,
          icon:    'link',
          default: '—'
        }.freeze,
        {
          key:   'actions',
          label: ' ',
          value: lambda { |item|
            Librum::Core::View::Components::Resources::TableActions.new(
              data:     item,
              resource: resource
            )
          }
        }
      ].freeze
    }.freeze
    private_constant :COLUMNS_FOR

    # @param data [Array<Publisher>] the table data to render.
    # @param resource [Cuprum::Rails::Resource] the controller resource.
    def initialize(data:, resource:)
      super(
        columns:  COLUMNS_FOR.call(resource),
        data:     data,
        resource: resource
      )
    end
  end
end
