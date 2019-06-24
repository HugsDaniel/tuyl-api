require 'rails_helper'

describe "post an activity route", :type => :request do
  let!(:user) { FactoryBot.create(:user) }

  it "requires login" do
    post '/api/v1/activities', params: { activity: { name: 'Test Activity', description: 'Test description' } }

    expect(response).to have_http_status(:unauthorized)
  end

  before do
    sign_in user
    post '/api/v1/activities', params: { activity: { name: 'Test Activity', description: 'Test description' } }
  end

  it 'returns the activity name' do
    expect(JSON.parse(response.body)['name']).to eq('Test Activity')
  end

  it 'returns the activity description' do
    expect(JSON.parse(response.body)['description']).to eq('Test description')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
