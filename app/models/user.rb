# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist

  has_many :user_activities
  has_many :activities, through: :user_activities

  has_many :user_skills
  has_many :skills, through: :user_skills

  after_create :create_user_skills

  private

  def create_user_skills
    Skill.all.map { |skill| user_skills.create(skill: skill) }
  end
end
