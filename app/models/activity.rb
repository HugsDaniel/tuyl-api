class Activity < ApplicationRecord
  validates :name, :description, presence: true
end
