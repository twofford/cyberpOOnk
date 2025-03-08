# frozen_string_literal: true

class Check
  attr_reader :performer, :difficulty_level, :stat, :skill, :modifiers

  def initialize(performer:, difficulty_level:, stat: nil, skill: nil, modifiers: [])
    @performer = performer
    @difficulty_level = difficulty_level
    @stat = stat
    @skill = skill
    @modifiers = modifiers
  end

  def make
    calculate_degree_of_success(difficulty_level: difficulty_level, roll: roll)
  end

  private

  def roll
    D20.roll + performer.public_send(stat) + performer.public_send(skill) + modifiers.sum
  end

  def calculate_degree_of_success(difficulty_level:, roll:)
    Constants::DIFFICULTY_LEVELS[difficulty_level].each do |degree, range|
      return degree if range.include?(roll)
    end
    raise UnknownDegreeOfSuccessError
  end
end
