# frozen_string_literal: true

class AddExpToJwtBlacklist < ActiveRecord::Migration[5.2]
  def change
    add_column :jwt_blacklist, :exp, :datetime, null: false
  end
end
