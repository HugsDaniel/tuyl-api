require 'rails_helper'

describe "get one user activity route", :type => :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:activity) { FactoryBot.create(:activity) }
  let!(:user_activity) { UserActivity.create(user: user, activity: activity) }

  it "requires login" do
    get "/api/v1/user_activities/#{user_activity.id}"

    expect(response).to have_http_status(:unauthorized)
  end

  before do
    sign_in user
    get "/api/v1/user_activities/#{user_activity.id}"
  end

  it 'returns user activity' do
    expect(JSON.parse(response.body)['id']).to eq(user_activity.id)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
