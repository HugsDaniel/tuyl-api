require 'rails_helper'

describe "login a user route", :type => :request do
  let!(:user) { FactoryBot.create(:user, email: 'test@example.com') }

  it 'requires the user to exist' do
    post '/login', params: { user: { email: 'nonexistinguser@example.com', password: 'password' } }
    expect(response).to have_http_status(:unauthorized)
  end

  before do
    post '/login', params: { user: { email: 'test@example.com', password: 'password' } }
  end

  it 'returns the user email' do
    expect(JSON.parse(response.body)['email']).to eq('test@example.com')
  end

  it 'returns an auth token' do
    expect((response.headers)['Authorization']).not_to eq(nil)
  end

  it 'returns a ok status' do
    expect(response).to have_http_status(:ok)
  end
end
