require 'rails_helper'

RSpec.describe UserSkill, type: 'model' do
  subject(:user_skill) { FactoryBot.build(:user_skill) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:skill) }
  end
end
