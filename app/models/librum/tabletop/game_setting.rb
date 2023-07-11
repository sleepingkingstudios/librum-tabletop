# frozen_string_literal: true

module Librum::Tabletop
  # A setting for playing tabletop roleplaying games.
  class GameSetting < ApplicationRecord
    ### Associations
    belongs_to :publisher

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
# Table name: librum_tabletop_game_settings
#
#  id           :uuid             not null, primary key
#  name         :string           default(""), not null
#  slug         :string           default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  publisher_id :uuid
#
# Indexes
#
#  index_librum_tabletop_game_settings_on_name          (name) UNIQUE
#  index_librum_tabletop_game_settings_on_publisher_id  (publisher_id)
#  index_librum_tabletop_game_settings_on_slug          (slug) UNIQUE
#
