require 'rails_helper'

describe "register a user route", :type => :request do
  before do
    post '/sign_up', params: { user: { email: 'test@example.com', password: 'password', password_confirmation: 'password' } }
  end

  it 'returns the user email' do
    expect(JSON.parse(response.body)['email']).to eq('test@example.com')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:ok)
  end
end
