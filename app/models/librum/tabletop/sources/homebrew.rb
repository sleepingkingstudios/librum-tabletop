# frozen_string_literal: true

module Librum::Tabletop::Sources
  # A representation of a user's body of custom work.
  class Homebrew < Librum::Tabletop::Source
    ### Associations
    belongs_to :user, class_name: Librum::Tabletop::Engine.config.user_model # rubocop:disable Rails/ReflectionClassName

    ### Validations
    validates :game_setting_id, absence: true
    validates :game_system_id,  absence: true
    validates :publisher_id,    absence: true
    validate :validate_name_matches_user
    validate :validate_slug_matches_user

    # @return [true] true if the source is homebrew, otherwise false.
    def homebrew?
      true
    end

    # (see Librum::Tabletop::Source#metadata)
    def metadata
      {
        'homebrew' => homebrew?,
        'legacy'   => legacy?,
        'official' => official?,
        'playtest' => playtest?,
        'username' => user&.username
      }
    end

    private

    def validate_name_matches_user
      return unless user
      return if name == "User: #{user.username}"

      errors.add 'name',
        I18n.t('librum.tabletop.errors.models.sources.homebrew.invalid_name')
    end

    def validate_slug_matches_user
      return unless user
      return if slug == "user-#{user.slug}"

      errors.add 'slug',
        I18n.t('librum.tabletop.errors.models.sources.homebrew.invalid_slug')
    end
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
