class Api::V1::UsersController < ApplicationController
  def dashboard
    @user = current_user
    user_activities = @user.user_activities.order('updated_at DESC')
    user_skills = @user.user_skills

    @json_user_activites = user_activities.as_json(include: :activity)
    @json_user_skills = user_skills.as_json(include: :skill)

    render json: {
      user_activities: @json_user_activites,
      user: @user,
      user_skills: @json_user_skills
    }
  end
end
