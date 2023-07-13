# frozen_string_literal: true

module Spec::Support
  class GenericReference < Librum::Tabletop::Reference
    self.table_name = 'generic_references'

    # Validations
    with_options unless: :stub? do
      validates :details, presence: true
    end
  end
end

# == Schema Information
#
# Table name: generic_references
#
#  id              :uuid             not null, primary key
#  details         :text
#  name            :string           default(""), not null
#  slug            :string           default(""), not null
#  source_metadata :jsonb            not null
#  stub            :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  source_id       :uuid
#
# Indexes
#
#  index_generic_references_on_slug                (slug)
#  index_generic_references_on_source_id           (source_id)
#  index_generic_references_on_source_id_and_slug  (source_id,slug) UNIQUE
#
