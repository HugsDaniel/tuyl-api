require 'rails_helper'

describe "get all user skills route", :type => :request do
  let!(:skills) {FactoryBot.create_list(:skill, 6)}
  let!(:user) { FactoryBot.create(:user) }

  it "requires login" do
    get '/api/v1/user_skills'

    expect(response).to have_http_status(:unauthorized)
  end

  before do
    sign_in user
    get '/api/v1/user_skills'
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'returns all user skills' do
    expect(JSON.parse(response.body).size).to eq(6)
  end

  it 'includes only the skill name for each user skill' do
    expect(JSON.parse(response.body).first['skill']['name']).to eq(Skill.first.name)
    expect(JSON.parse(response.body).first['skill']['description']).to eq nil
  end

end
