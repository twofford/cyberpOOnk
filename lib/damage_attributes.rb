# frozen_string_literal: true

class DamageAttributes < Item
  attr_reader :damage_dice, :crit_multiplier

  def initialize(damage_dice:, crit_multiplier:)
    type_check_arg(arg: damage_dice, klass: Die)
    type_check_arg(arg: crit_multiplier, klass: Integer)

    @damage_dice = damage_dice
    @crit_multiplier = crit_multiplier
  end
end
