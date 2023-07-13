# frozen_string_literal: true

module Spec::Support
  class User < Librum::Tabletop::ApplicationRecord
    include Librum::Tabletop::HomebrewUser

    self.table_name = 'users'

    ### Validations
    validates :name, presence: true

    # @return [String] the user name.
    def username
      name
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  name       :string
#  password   :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
