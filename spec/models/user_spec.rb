require 'rails_helper'

RSpec.describe User, type: 'model' do
  subject(:user) { FactoryBot.build(:user) }

  describe 'associations' do
    it { is_expected.to have_many(:user_skills) }
    it { is_expected.to have_many(:skills) }
    it { is_expected.to have_many(:user_activities) }
    it { is_expected.to have_many(:activities) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  context 'after user creation' do
    let!(:skills) { FactoryBot.create_list(:skill, 6) }
    let!(:user) { FactoryBot.create(:user) }

    it 'create user skills' do
      expect(user.user_skills.size).to eq 6
    end
  end
end
