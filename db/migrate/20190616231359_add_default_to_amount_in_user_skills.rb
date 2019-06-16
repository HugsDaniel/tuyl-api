class AddDefaultToAmountInUserSkills < ActiveRecord::Migration[5.2]
  def change
    change_column :user_skills, :amount, :integer, default: 0
  end
end
