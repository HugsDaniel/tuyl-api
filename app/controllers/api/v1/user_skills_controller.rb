class Api::V1::UserSkillsController < ApplicationController
  def index
    @user_skills = current_user.user_skills

    render json: @user_skills.as_json(include: { skill: { only: :name} })
  end

  def update_multiple
    @user_skills = current_user.user_skills

    user_skills_params.each do |params|
      @user_skills.map { |user_skill| update_attributes(user_skill, params) }
    end

    render json: @user_skills
  end

  private

  def user_skills_params
    params.require(:user_skills).map { |user_skill| user_skill.permit! }
  end

  def update_attributes(user_skill, params)
    user_skill.update_attributes(amount: params[:amount].to_i) if user_skill.id == params[:id].to_i
  end
end
