# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserActivity, type: 'model' do
  subject(:user_activity) { FactoryBot.build(:user_activity) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:activity) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:begin_time) }
    it { is_expected.to validate_presence_of(:end_time) }
  end
end
