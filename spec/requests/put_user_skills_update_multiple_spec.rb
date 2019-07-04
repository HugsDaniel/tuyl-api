# frozen_string_literal: true

require 'rails_helper'

describe 'PUT /api/v1/user_skills/update_multiple' do
  let!(:skills) { FactoryBot.create_list(:skill, 6) }
  let!(:user) { FactoryBot.create(:user) }

  it 'requires login' do
    put '/api/v1/user_skills/update_multiple', params: { user_skills: [{ id: user.user_skills.first.id, amount: 20 }, { id: user.user_skills.last.id, amount: 10 }] }

    expect(response).to have_http_status(:unauthorized)
  end

  it 'updates mutliple user skills' do
    sign_in user

    put '/api/v1/user_skills/update_multiple', params: { user_skills: [{ id: user.user_skills.first.id, amount: 20 }, { id: user.user_skills.last.id, amount: 10 }] }

    expect(response.status).to eq(200)

    expect(UserSkill.find(user.user_skills.first.id).amount).to eq(20)
    expect(UserSkill.find(user.user_skills.last.id).amount).to eq(10)
  end
end
