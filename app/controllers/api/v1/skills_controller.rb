# frozen_string_literal: true

class Api::V1::SkillsController < ApplicationController
  def index
    @skills = Skill.all

    render json: @skills
  end
end
