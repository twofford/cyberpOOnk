# frozen_string_literal: true

class MeleeWeapon < Weapon
  attr_reader :damage_attributes

  def initialize(damage_attributes:, mods: [])
    type_check_arg(arg: damage_attributes, klass: DamageAttributes)
    type_check_arg(arg: mods, klass: Mod)

    super(damage_attributes: damage_attributes, mods: mods)
  end

  def max_range
    0
  end
end
