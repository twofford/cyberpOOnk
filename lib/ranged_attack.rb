# frozen_string_literal: true

class RangedAttack < Attack
  attr_reader :attacker, :target, :range_to_target, :weapon, :modifiers

  def initialize(attacker:, target:, range_to_target:, weapon:, modifiers: [])
    super
  end

  def make
    super

    roll = D20.roll
    return :misfire if weapon.misfired?(roll: roll)

    difficulty_level = calculate_difficulty_level
    roll = roll + attacker.public_send(stat) + attacker.public_send(skill) + modifiers.sum
    calculate_degree_of_success(difficulty_level:, roll:)
  end
end
