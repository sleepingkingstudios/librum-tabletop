# frozen_string_literal: true

module Librum::Tabletop
  # Helper for defining homebrew source association.
  module HomebrewUser
    extend ActiveSupport::Concern

    included do
      has_one :homebrew_source,
        class_name: 'Librum::Tabletop::Sources::Homebrew',
        dependent:  :destroy
    end
  end
end
