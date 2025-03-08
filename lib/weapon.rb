# frozen_string_literal: true

class Weapon < Item
  attr_reader :damage_attributes, :max_range, :type

  def initialize(damage_attributes:, mods: [])
    @damage_attributes = damage_attributes
    @mods = mods
    super()
  end

  def roll_damage(crit: false)
    roll = if damage_attributes.damage_dice.is_a?(Array)
             damage_attributes.damage_dice.map(&:roll).sum
           else
             damage_attributes.damage_dice.roll
           end
    return roll * damage_attributes.crit_multiplier if crit

    roll
  end

  def roll_crit_damage
    roll_damage(crit: true)
  end

  def stat_and_skill(user:)
    return %i[reflexes marksmanship] if is_a?(Gun)
    return [best_of_stats(stats: user.stats, stat1: :brawn, stat2: :reflexes), :melee_combat] if is_a?(MeleeWeapon)
    return [best_of_stats(stats: user.stats, stat1: :brawn, stat2: :reflexes), :martial_arts] if is_a?(MartialArt)

    raise UnknownWeaponTypeError
  end

  def calculate_price
    price = 0

    # Set price based on ammo damage dice
    if damage_attributes.damage_dice.is_a?(Array)
      damage_attributes.damage_dice.each do |die|
        price += Constants::DAMAGE_DICE_COSTS[die.class.name.to_sym]
      end
    else
      price += Constants::DAMAGE_DICE_COSTS[damage_attributes.damage_dice.name.to_sym]
    end

    # Adjust price based on ammo crit multiplier
    price *= Constants::CRIT_MULTIPLIER_COSTS[damage_attributes.crit_multiplier]

    # Adjust price based on ammo quality
    price *= Constants::AMMO_QUALITY_COSTS[ammo.quality]

    # Adjust base price based on max range
    Constants::RANGE_LIMIT_COSTS.each do |range, multiplier|
      price *= multiplier if range.include?(max_range)
    end

    # Adjust price based on reliability
    price *= Constants::RELIABILITY_COSTS[reliability]

    to_nearest_hundred(num: price)
  end
end
