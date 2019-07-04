# frozen_string_literal: true

require 'rails_helper'

describe 'PUT /api/v1/user_activities/:id/done' do
  let!(:user) { FactoryBot.create(:user) }
  let!(:activity) { FactoryBot.create(:activity) }

  let!(:user_activity) { UserActivity.create(user: user, activity: activity, begin_time: DateTime.now, end_time: DateTime.now + 2.hours) }

  it 'requires login' do
    put "/api/v1/user_activities/#{user_activity.id}/done", params: { user_activity: { satisfaction_level: 3 } }
    expect(response).to have_http_status(:unauthorized)
  end

  it 'marks a user activity as done' do
    sign_in user

    put "/api/v1/user_activities/#{user_activity.id}/done", params: { user_activity: { satisfaction_level: 3 } }

    expect(response.status).to eq(200)

    expect(UserActivity.find(user_activity.id).status).to eq('done')
    expect(UserActivity.find(user_activity.id).satisfaction_level).to eq(3)
  end
end
