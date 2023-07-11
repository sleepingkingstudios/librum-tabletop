# frozen_string_literal: true

class CreateSources < ActiveRecord::Migration[7.0]
  def change
    create_table :librum_tabletop_sources, id: :uuid do |t|
      t.string :type, null: false
      t.jsonb  :data, null: false, default: {}
      t.string :name, null: false, default: ''
      t.string :slug, null: false, default: ''

      t.timestamps
    end

    add_reference :librum_tabletop_sources,
      :game_setting,
      index: true,
      type:  :uuid

    add_reference :librum_tabletop_sources,
      :game_system,
      index: true,
      type:  :uuid

    add_reference :librum_tabletop_sources,
      :publisher,
      index: true,
      type:  :uuid

    add_reference :librum_tabletop_sources,
      :user,
      index: true,
      type:  :uuid

    add_index :librum_tabletop_sources,
      %i[name game_system_id publisher_id],
      name:   'index_sources_on_name_and_game_system_id_and_publisher_id',
      unique: true
    add_index :librum_tabletop_sources,
      %i[slug game_system_id],
      name:   'index_sources_on_slug_and_game_system_id',
      unique: true
  end
end
