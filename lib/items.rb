# frozen_string_literal: true

class Item
end

class Weapon < Item
  attr_reader :damage_attributes

  def initialize(damage_attributes:)
    @damage_attributes = damage_attributes
  end
end

class RangedWeapon < Weapon
  ## The range (in feet) at which ranged attacks count as Easy
  EASY_RANGE_LIMIT = 10

  attr_reader :damage_attributes, :max_range

  def initialize(damage_attributes:, max_range:)
    super(damage_attributes: damage_attributes)
    @max_range = max_range
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

  def to_hit_ranges
    {
      easy: easy_range,
      medium: medium_range,
      hard: hard_range,
      very_hard: very_hard_range,
      nigh_impossible: nigh_impossible_range
    }
  end
end

class MeleeWeapon < Weapon
  attr_reader :damage_attributes

  def max_range
    0
  end
end

class Gun < RangedWeapon
  attr_reader :damage_attributes
  alias ammo damage_attributes

  def initialize(ammo:, max_range:)
    super(damage_attributes: ammo, max_range: max_range)
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
