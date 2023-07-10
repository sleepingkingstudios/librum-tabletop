# frozen_string_literal: true

module Librum
  module Tabletop
    # Rails engine for Librum::Tabletop.
    class Engine < ::Rails::Engine
      isolate_namespace Librum::Tabletop
    end
  end
end
