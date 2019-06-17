class Api::V1::UserSkillsController < ApplicationController
  def index
    @user_skills = current_user.user_skills

    render json: @user_skills.as_json(include: { skill: { only: :name} })
  end

  def update_multiple
    @user_skills = current_user.user_skills

    user_skills_params.each do |params|
      @user_skills.map { |skill| update_attributes(skill, params) }
    end
  end

  private

  def user_skills_params
    params.require(:user_skills).map { |user_skill| user_skill.permit! }
  end

  def update_attributes(user_skill, params)
    user_skill.update_attributes(amount: params[:amount]) if user_skill.id == params[:id]
  end
end
