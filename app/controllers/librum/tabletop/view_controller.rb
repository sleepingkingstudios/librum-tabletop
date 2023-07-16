# frozen_string_literal: true

require 'librum/core/actions/view/middleware/page_navigation'

module Librum::Tabletop
  # Abstract base class for HTML controllers.
  class ViewController < Librum::Core::ViewController
    middleware Librum::Core::Actions::View::Middleware::PageNavigation.new(
      navigation: Librum::Tabletop::Engine.config.page_navigation
    )
  end
end
