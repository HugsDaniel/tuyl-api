class Api::V1::UserSkillsController < ApplicationController
  def index
    @user_skills = current_user.user_skills

    render json: @user_skills.as_json(include: :skill)
  end
end
