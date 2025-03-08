# frozen_string_literal: true

class DamageAttributes < Item
  attr_reader :damage_dice, :crit_multiplier

  def initialize(damage_dice:, crit_multiplier:)
    @damage_dice = damage_dice
    @crit_multiplier = crit_multiplier
  end
end
