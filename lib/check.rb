# frozen_string_literal: true

class Check
  attr_reader :performer, :stat, :skill, :modifiers, :difficulty_level

  def initialize(performer:, stat:, skill:, difficulty_level:, modifiers: [])
    type_check_arg(arg: performer, klass: Character),
    type_check_arg(arg: stat, klass: Symbol)
    type_check_arg(arg: skill, klass: Symbol)
    type_check_arg(arg: difficulty_level, klass: Symbol)
    type_check_arg(arg: modifiers, klass: Integer)

    @performer = performer
    @stat = stat
    @skill = skill
    @modifiers = modifiers
    @difficulty_level = difficulty_level
  end

  def make
    calculate_degree_of_success(difficulty_level: difficulty_level, result: roll)
  end

  def roll
    D20.roll + performer.public_send(stat) + performer.public_send(skill) + mods.sum
  end

  def calculate_degree_of_success(difficulty_level:, result:)
    Rules::DIFFICULTY_LEVELS[difficulty_level].each do |degree, range|
      return degree if range.include?(result)
    end
    raise UnknownDegreeOfSuccessError
  end
end
