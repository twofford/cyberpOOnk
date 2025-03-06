# frozen_string_literal: true

class Ammo < DamageAttributes
  attr_reader :quality

  def initialize(damage_dice:, crit_multiplier:, quality: 0)
    type_check_arg(arg: damage_dice, klass: Die)
    type_check_arg(arg: crit_multiplier, klass: Integer)
    type_check_arg(arg: quality, klass: Integer,
                   options: { between: Rules::AMMO_QUALITY_COSTS.keys.first..Rules::AMMO_QUALITY_COSTS.keys.last })

    @quality = quality
    super(damage_dice: damage_dice, crit_multiplier: crit_multiplier)
  end
end
