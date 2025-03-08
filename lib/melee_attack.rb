# frozen_string_literal: true

class MeleeAttack < Attack
  attr_reader :attacker, :target, :weapon, :modifiers

  def initialize(attacker:, target:, weapon:, modifiers: [])
    super(
      attacker: attacker,
      target: target,
      range_to_target: 0,
      weapon: weapon,
      modifiers: modifiers
    )
  end

  def make
    super

    roll = D20.roll + attacker.public_send(stat) + attacker.public_send(skill) + modifiers.sum
    calculate_degree_of_success(difficulty_level: :easy, roll: roll)
  end
end
