class Api::V1::ActivitiesController < ApplicationController
  def index
    @activities = Activity.all.order('created_at DESC')

    render json: @activities
  end

  def create
    @activity = Activity.new(activity_params)

    if @activity.save
      render json: @activity, status: :created
    else
      render json: @activity.errors, status: :unprocessable_entity
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :description, :character)
  end
end
