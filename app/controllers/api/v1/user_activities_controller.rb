class Api::V1::UserActivitiesController < ApplicationController
  def create
    @user_activity = current_user.user_activities.build(user_activity_params)

    if @user_activity.save
      render json: @user_activity, status: :created
    else
      render json: @user_activity.errors, status: :unprocessable_entity
    end
  end

  def done
    @user_activity = UserActivity.find(params[:id])

    @user_activity.status = "done"
    @user_activity.save

    deconstructed_user_activities = current_user.user_activities.includes(:activity)

    @user_activities = []
    deconstructed_user_activities.each do |ua|
      hash = {
        id: ua.id,
        begin_time: ua.begin_time,
        end_time:   ua.end_time,
        activity_name: ua.activity.name,
        activity_description: ua.activity.description,
        status: ua.status
      }
      @user_activities << hash
    end

    render json: @user_activities
  end

  private

  def user_activity_params
    params.require(:user_activity).permit(:activity_id, :satisfaction_level, :begin_time, :end_time)
  end
end
