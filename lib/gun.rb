# frozen_string_literal: true

class Gun < RangedWeapon
  attr_reader :damage_attributes, :reliability
  alias ammo damage_attributes

  def initialize(ammo:, max_range:, reliability:, mods: [])
    @reliability = reliability
    super(damage_attributes: ammo, max_range: max_range, mods: mods)
  end

  def misfire_range
    1..[5 - ammo.quality, 1].max
  end

  def misfired?(roll:)
    misfire_range.include?(roll)
  end
end
