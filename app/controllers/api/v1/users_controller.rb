class Api::V1::UsersController < ApplicationController
  def dashboard
    @user = current_user
    user_activities = @user.user_activities.order('updated_at DESC').includes(:activity)
    user_skills = @user.user_skills

    # @json_user_activites = user_activities.as_json(include: :activity)
    @json_user_activities = user_activities.map do |ua|
      {
        id:       ua.id,
        title:    ua.activity.name,
        content:  ua.activity.description,
        start:    ua.begin_time.strftime("%Y-%m-%d %H:%M"),
        end:      ua.end_time.strftime("%Y-%m-%d %H:%M"),
        status:   ua.status
      }
    end

    @json_user_skills = user_skills.as_json(include: :skill)

    render json: {
      user_activities: @json_user_activities,
      user: @user,
      user_skills: @json_user_skills
    }
  end
end
