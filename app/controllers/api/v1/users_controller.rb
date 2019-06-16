class Api::V1::UsersController < ApplicationController
  def dashboard
    @user = current_user
    user_activities = @user.user_activities.order('updated_at DESC')

    @json_user_activites = user_activities.as_json(include: :activity)

    render json: {
      user_activities: @json_user_activites,
      user: @user
    }
  end
end
