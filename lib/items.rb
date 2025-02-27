# frozen_string_literal: true

class Item
end

class Cyberdeck < Item
  attr_reader :memory, :nouns, :verbs

  def initialize(memory:, nouns: [], verbs: [])
    @memory = memory
    @nouns = nouns
    @verbs = verbs
  end
end

class Weapon < Item
  attr_reader :damage_attributes

  def initialize(damage_attributes:)
    @damage_attributes = damage_attributes
  end

  def roll_damage(crit: false)
    roll = damage_attributes.damage_die.roll
    return roll * damage_attributes.crit_multiplier if crit

    roll
  end

  def roll_crit_damge
    roll_damage(crit: true)
  end

  def misfired?
    false
  end

  def stat_and_skill(user:)
    return %i[reflexes marksmanship] if is_a?(Gun)
    return [best_of_stats(stats: user.stats, stat1: :brawn, stat2: :reflexes), :melee_combat] if is_a?(MeleeWeapon)
    return [best_of_stats(stats: user.stats, stat1: :brawn, stat2: :reflexes), :martial_arts] if is_a?(MartialArt)

    raise NotImplementedError
  end
end

class RangedWeapon < Weapon
  ## The upper limit (in feet) at which ranged attacks count as Easy
  EASY_RANGE_LIMIT = 10

  attr_reader :damage_attributes, :max_range

  def initialize(damage_attributes:, max_range:)
    super(damage_attributes: damage_attributes)
    @max_range = max_range
  end

  def dc_for_target(range_to_target:)
    dc_ranges.each do |dc, range|
      return dc if range.include?(range_to_target)
    end
  end

  private

  def non_easy_range
    (max_range - EASY_RANGE_LIMIT).to_f
  end

  def quartile_width
    non_easy_range / 4
  end

  def easy_range
    1..EASY_RANGE_LIMIT
  end

  def medium_range
    (EASY_RANGE_LIMIT + 1)..(EASY_RANGE_LIMIT + quartile_width).round
  end

  def hard_range
    (medium_range.end + 1)..(EASY_RANGE_LIMIT + quartile_width * 2).round
  end

  def very_hard_range
    (hard_range.end + 1)..(EASY_RANGE_LIMIT + quartile_width * 3).round
  end

  def nigh_impossible_range
    (very_hard_range.end + 1)..max_range
  end

  def impossible_range
    (max_range + 1)..Float::INFINITY
  end

  def dc_ranges
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

  def max_range
    0
  end
end

class MartialArt < Weapon
end

class Gun < RangedWeapon
  attr_reader :damage_attributes, :reliability
  alias ammo damage_attributes

  def initialize(ammo:, max_range:, reliability:)
    super(damage_attributes: ammo, max_range: max_range)
    @reliability = reliability
  end

  def misfires_on
    1..[(20 - reliability), 1].max
  end

  def misfired?(roll:)
    misfires_on.include?(roll)
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
end
