# frozen_string_literal: true

class Attack < Check
  attr_reader :attacker, :target, :modifiers, :range, :weapon

  def initialize(attacker:, target:, modifiers: [], range: nil, weapon: nil)
    super(performer: attacker, modifiers: modifiers)
    @target = target
    @range = range
    @weapon = weapon
  end

  def at(range:)
    @range = range
    # check if all vars are present. if so, call make and
    # return the result
  end

  def with(weapon:)
    @weapon = weapon
    # check if all vars are present. if so, call make and
    # return the result
  end

  private

  def calculate_difficulty_level(range_to_target:)
    difficulty_level_ranges.each do |dl, range|
      return dl if range.include?(range_to_target)
    end
    raise UnkownDifficultyLevelError
  end

  def easy_range
    1..Rules::RANGE_LIMITS[:easy]
  end

  def medium_range
    (Rules::RANGE_LIMITS[:easy] + 1)..Rules::RANGE_LIMITS[:medium]
  end

  def hard_range
    (Rules::RANGE_LIMITS[:medium] + 1)..Rules::RANGE_LIMITS[:hard]
  end

  def very_hard_range
    (Rules::RANGE_LIMITS[:hard] + 1)..Rules::RANGE_LIMITS[:very_hard]
  end

  def nigh_impossible_range
    (Rules::RANGE_LIMITS[:very_hard] + 1)..Rules::RANGE_LIMITS[:nigh_impossible]
  end

  def impossible_range
    (Rules::RANGE_LIMITS[:nigh_impossible] + 1)..Float::INFINITY
  end

  def difficulty_level_ranges
    {
      easy: easy_range,
      medium: medium_range,
      hard: hard_range,
      very_hard: very_hard_range,
      nigh_impossible: nigh_impossible_range,
      impossible: impossible_range
    }
  end
end
