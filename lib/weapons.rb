# frozen_string_literal: true

class Weapon < Item
  attr_reader :damage_attributes

  def initialize(damage_attributes:, mods: [])
    @damage_attributes = damage_attributes
    @mods = mods
  end

  def roll_damage(crit: false)
    roll = damage_attributes.damage_die.roll
    return roll * damage_attributes.crit_multiplier if crit

    roll
  end

  def roll_crit_damge
    roll_damage(crit: true)
  end

  def stat_and_skill(user:)
    return %i[reflexes marksmanship] if is_a?(Gun)
    return [best_of_stats(stats: user.stats, stat1: :brawn, stat2: :reflexes), :melee_combat] if is_a?(MeleeWeapon)
    return [best_of_stats(stats: user.stats, stat1: :brawn, stat2: :reflexes), :martial_arts] if is_a?(MartialArt)

    raise UnknownWeaponTypeError
  end
end

class RangedWeapon < Weapon
  attr_reader :damage_attributes, :max_range

  def initialize(damage_attributes:, max_range:, mods: [])
    super(damage_attributes: damage_attributes, mods: mods)
    @max_range = max_range
  end

  def difficulty_level_for_target(range_to_target:)
    difficulty_level_ranges.each do |dl, range|
      return dl if range.include?(range_to_target)
    end
    raise UnkownDifficultyLevelError
  end

  private

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

class MeleeWeapon < Weapon
  attr_reader :damage_attributes

  def initialize(damage_attributes:, mods: [])
    super(damage_attributes: damage_attributes, mods: mods)
  end

  def max_range
    0
  end
end

class MartialArt < Weapon
end

class Gun < RangedWeapon
  attr_reader :damage_attributes, :reliability
  alias ammo damage_attributes

  def initialize(ammo:, max_range:, reliability:, mods: [])
    super(damage_attributes: ammo, max_range: max_range, mods: mods)

    @reliability = reliability
  end

  def misfire_range
    1..[(20 - reliability + ammo.quality), 1].max
  end

  def misfired?(roll:)
    misfire_range.include?(roll)
  end
end

class DamageAttributes
  attr_reader :damage_die, :crit_multiplier

  def initialize(damage_die:, crit_multiplier:)
    @damage_die = damage_die
    @crit_multiplier = crit_multiplier
  end
end

class Ammo < DamageAttributes
  attr_reader :quality

  def initialize(damage_die:, crit_multiplier:, quality: 0)
    super(damage_die: damage_die, crit_multiplier: crit_multiplier)
    # Ammo quality affects misfire chance and severity
    @quality = quality
  end
end
