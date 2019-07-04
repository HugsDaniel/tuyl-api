# frozen_string_literal: true

require 'rails_helper'

describe 'get user dashboard route', type: :request do
  let!(:skills) { FactoryBot.create_list(:skill, 6) }
  let!(:user) { FactoryBot.create(:user) }
  let!(:activity) { FactoryBot.create(:activity) }
  let!(:user_activity) { UserActivity.create(user: user, activity: activity, begin_time: DateTime.now, end_time: DateTime.now + 2.hours) }

  it 'requires login' do
    get '/api/v1/dashboard'

    expect(response).to have_http_status(:unauthorized)
  end

  before do
    sign_in user
    get '/api/v1/dashboard'
  end

  it 'returns all user activities' do
    expect(JSON.parse(response.body)['user_activities'].size).to eq(1)
  end

  it 'returns all user skills' do
    expect(JSON.parse(response.body)['user_skills'].size).to eq(6)
  end

  it 'returns user info' do
    expect(JSON.parse(response.body)['user']['email']).to eq(user.email)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
