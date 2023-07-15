# frozen_string_literal: true

module Librum::Tabletop::Sources
  # An abstract source for published game materials.
  class Publication < Librum::Tabletop::Source
    ### Attributes
    data_property :legacy,   predicate: true
    data_property :official, predicate: true
    data_property :playtest, predicate: true

    ### Associations
    belongs_to :game_setting, optional: true
    belongs_to :game_system
    belongs_to :publisher, class_name: 'Librum::Tabletop::Publisher'

    ### Validations
    validates :user_id, absence: true
  end
end

# == Schema Information
#
# Table name: librum_tabletop_sources
#
#  id              :uuid             not null, primary key
#  data            :jsonb            not null
#  name            :string           default(""), not null
#  slug            :string           default(""), not null
#  type            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  game_setting_id :uuid
#  game_system_id  :uuid
#  publisher_id    :uuid
#  user_id         :uuid
#
# Indexes
#
#  index_librum_tabletop_sources_on_game_setting_id             (game_setting_id)
#  index_librum_tabletop_sources_on_game_system_id              (game_system_id)
#  index_librum_tabletop_sources_on_publisher_id                (publisher_id)
#  index_librum_tabletop_sources_on_user_id                     (user_id)
#  index_tabletop_sources_on_name_and_system_and_publisher_ids  (name,game_system_id,publisher_id) UNIQUE
#  index_tabletop_sources_on_slug_and_game_system_id            (slug,game_system_id) UNIQUE
#
