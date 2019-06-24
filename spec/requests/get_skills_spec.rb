require 'rails_helper'

describe "get all skills route", :type => :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:skills) {FactoryBot.create_list(:skill, 20)}

  it "requires login" do
    get '/api/v1/skills'

    expect(response).to have_http_status(:unauthorized)
  end

  before do
    sign_in user
    get '/api/v1/skills'
  end

  it 'returns all skills' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
