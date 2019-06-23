require 'rails_helper'

describe "get all activities route", :type => :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:activities) {FactoryBot.create_list(:activity, 20)}

  it "requires login" do
    get '/api/v1/activities'

    expect(response).to have_http_status(:unauthorized)
  end

  before do
    sign_in user
    get '/api/v1/activities'
  end

  it 'returns all activities' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
