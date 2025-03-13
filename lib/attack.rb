# frozen_string_literal: true

class Attack < Check
  attr_reader :attacker, :target, :range_to_target, :weapon, :modifiers

  def initialize(attacker:, target:, range_to_target:, weapon:, modifiers: [])
    @attacker = attacker
    @target = target
    @range_to_target = range_to_target
    @weapon = weapon
    super(
      performer: attacker,
      difficulty_level: calculate_difficulty_level,
      stat: choose_stat,
      skill: choose_skill,
      modifiers: modifiers
    )
  end

  def make
    raise OutOfRangeError if range_to_target > weapon.max_range
  end

  private

  def calculate_difficulty_level
    Constants::RANGED_ATTACK_DLS.each do |dl, range|
      return dl if range.include?(range_to_target)
    end
    raise UnknownDifficultyLevelError
  end

  def choose_stat
    return :reflexes if weapon.is_a?(RangedWeapon)

    return :brawn if weapon.is_a?(MeleeWeapon)

    raise UnknownWeaponTypeError
  end

  def choose_skill
    return :marksmanship if weapon.is_a?(Gun)

    return :melee_combat if weapon.is_a?(MeleeWeapon)

    return :martial_arts if weapon.is_a?(MartialArt)

    raise UnknownWeaponTypeError
  end
end
