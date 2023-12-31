# frozen_string_literal: true

module Librum::Tabletop
  # A publisher of game systems or materials.
  class Publisher < Librum::Tabletop::ApplicationRecord
    ### Associations
    has_many :game_settings,
      dependent: :nullify
    has_many :game_systems,
      dependent: :nullify

    ### Validations
    validates :name,
      presence:   true,
      uniqueness: true
    validates :slug,
      format:     {
        message: I18n.t('errors.messages.kebab_case'),
        with:    /\A[a-z0-9]+(-[a-z0-9]+)*\z/
      },
      presence:   true,
      uniqueness: true
  end
end

# == Schema Information
#
# Table name: librum_tabletop_publishers
#
#  id         :uuid             not null, primary key
#  name       :string           default(""), not null
#  slug       :string           default(""), not null
#  website    :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_librum_tabletop_publishers_on_name  (name) UNIQUE
#  index_librum_tabletop_publishers_on_slug  (slug) UNIQUE
#
