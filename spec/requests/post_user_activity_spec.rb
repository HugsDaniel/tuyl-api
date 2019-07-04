# frozen_string_literal: true

require 'rails_helper'

describe 'post a user activity route', type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:activity) { FactoryBot.create(:activity) }

  it 'requires login' do
    post '/api/v1/user_activities', params: { user_activity: { activity_id: activity.id, begin_time: '2019-06-23T18:27:49', end_time: '2019-06-23T20:27:49' } }

    expect(response).to have_http_status(:unauthorized)
  end

  before do
    sign_in user
    post '/api/v1/user_activities', params: { user_activity: { activity_id: activity.id, begin_time: '2019-06-23T18:27:49', end_time: '2019-06-23T20:27:49' } }
  end

  it 'returns the user activity' do
    expect(JSON.parse(response.body)['activity_id']).to eq(activity.id)
  end

  it 'returns the user activity begin time' do
    expect(JSON.parse(response.body)['begin_time']).to eq('2019-06-23T18:27:49.000Z')
  end

  it 'returns the user activity end time' do
    expect(JSON.parse(response.body)['end_time']).to eq('2019-06-23T20:27:49.000Z')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
