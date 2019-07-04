# frozen_string_literal: true

class CreateUserSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :user_skills do |t|
      t.references :user, foreign_key: true
      t.references :skill, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
