class Activity < ApplicationRecord
  validates :name, :description, presence: true

  has_many :user_activities
  has_many :users, through: :user_activities
end
