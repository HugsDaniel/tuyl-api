# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Skill, type: 'model' do
  subject(:skill) { FactoryBot.build(:skill) }

  describe 'associations' do
    it { is_expected.to have_many(:user_skills) }
    it { is_expected.to have_many(:users) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
