# frozen_string_literal: true

$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/lib"

require 'characters'
require 'cybernetics'
require 'dice'
require 'errors'
require 'feats'
require 'items'
require 'rules'
require 'skills'
require 'stats'
require 'utility'
require 'weapons'

# Weapons

flip22 = Gun.new(
  ammo: Ammo.new(damage_dice: D6, crit_multiplier: 2, quality: -1),
  max_range: 50,
  reliability: -3
)

railgun = Gun.new(
  ammo: Ammo.new(damage_dice: 6 * D10, crit_multiplier: 5, quality: 3),
  max_range: 1000,
  reliability: 3
)

# puts flip22.calculate_price
# puts railgun.calculate_price
flip22.set_price
railgun.set_price

puts flip22.price
puts railgun.price
