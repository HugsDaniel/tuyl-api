class Api::V1::UsersController < ApplicationController
  def dashboard
    @user = current_user
    deconstructed_user_activities = @user.user_activities.includes(:activity)

    @user_activities = []
    deconstructed_user_activities.each do |ua|
      hash = {
        begin_time: ua.begin_time,
        end_time:   ua.end_time,
        activity_name: ua.activity.name,
        activity_description: ua.activity.description
      }
      @user_activities << hash
    end

    render json: {
      user: @user,
      activities: @user_activities
    }
  end
end
