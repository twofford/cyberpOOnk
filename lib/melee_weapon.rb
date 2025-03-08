# frozen_string_literal: true

class MeleeWeapon < Weapon
  attr_reader :damage_attributes

  def initialize(damage_attributes:, mods: [])
    super(damage_attributes: damage_attributes, mods: mods)
  end

  def max_range
    0
  end
end
