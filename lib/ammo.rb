# frozen_string_literal: true

class Ammo < DamageAttributes
  attr_reader :quality

  def initialize(damage_dice:, crit_multiplier:, quality: 0)
    # Ammo quality afffects misfire chance and severity
    @quality = quality
    super(damage_dice: damage_dice, crit_multiplier: crit_multiplier)
  end
end
