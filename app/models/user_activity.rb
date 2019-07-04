# frozen_string_literal: true

class UserActivity < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :begin_time, :end_time, presence: true
end
