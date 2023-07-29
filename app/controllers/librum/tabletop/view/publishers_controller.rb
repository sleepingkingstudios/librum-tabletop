# frozen_string_literal: true

module Librum::Tabletop::View
  # View controller for managing Publisher entities.
  class PublishersController < Librum::Tabletop::ViewController
    def self.breadcrumbs
      base_url = Librum::Tabletop::Engine.config.base_url

      @breadcrumbs ||= [
        *Librum::Tabletop::Engine.config.page_breadcrumbs,
        {
          label: 'Publishers',
          url:   "#{base_url}/publishers"
        }
      ]
    end

    def self.resource # rubocop:disable Metrics/MethodLength
      base_url   = Librum::Tabletop::Engine.config.base_url
      components = Librum::Tabletop::View::Components::Publishers

      @resource ||=
        Librum::Core::Resources::ViewResource.new(
          base_path:            "#{base_url}/publishers",
          default_order:        :name,
          permitted_attributes: %w[
            name
            slug
            website
          ],
          resource_class:       Librum::Tabletop::Publisher,
          block_component:      components::Block,
          form_component:       components::Form,
          table_component:      components::Table
        )
    end

    middleware Librum::Core::Actions::View::Middleware::ResourceBreadcrumbs.new(
      breadcrumbs: breadcrumbs,
      resource:    resource
    )

    responder :html, Librum::Core::Responders::Html::ResourceResponder

    action :create,  Librum::Core::Actions::Create
    action :destroy, Librum::Core::Actions::Destroy, member: true
    action :edit,    Librum::Core::Actions::Show,    member: true
    action :index,   Librum::Core::Actions::Index
    action :new,     Cuprum::Rails::Action
    action :show,    Librum::Core::Actions::Show,    member: true
    action :update,  Librum::Core::Actions::Update,  member: true
  end
end
