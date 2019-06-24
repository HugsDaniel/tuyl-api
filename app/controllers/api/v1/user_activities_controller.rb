class Api::V1::UserActivitiesController < ApplicationController
  def create
    @user_activity = current_user.user_activities.build(user_activity_params)

    if @user_activity.save
      render json: @user_activity, status: :created
    else
      render json: @user_activity.errors, status: :unprocessable_entity
    end
  end

  def show
    @user_activity = UserActivity.find(params[:id])

    render json: @user_activity
  end

  def done
    @user_activity = UserActivity.find(params[:id])

    @user_activity.assign_attributes(user_activity_params)
    @user_activity.status = "done"

    if @user_activity.save
      render json: @user_activity
    end
  end

  private

  def user_activity_params
    params.require(:user_activity).permit(:activity_id, :satisfaction_level, :begin_time, :end_time)
  end
end
