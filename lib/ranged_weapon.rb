# frozen_string_literal: true

class RangedWeapon < Weapon
  attr_reader :damage_attributes

  def initialize(damage_attributes:, max_range:, mods: [])
    @max_range = max_range
    super(damage_attributes: damage_attributes, mods: mods)
  end
end
