# frozen_string_literal: true

$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/lib"

require 'utility'

autoload :Ammo,                         'ammo'
autoload :Armor,                        'armor'
autoload :Character,                    'character'
autoload :Cyberdeck,                    'items'
autoload :Cybernetic,                   'cybernetic'
autoload :DamageAttributes,             'damage_attributes'
autoload :Die,                          'dice'
autoload :D4,                           'dice'
autoload :D6,                           'dice'
autoload :D8,                           'dice'
autoload :D10,                          'dice'
autoload :D12,                          'dice'
autoload :D20,                          'dice'
autoload :D100,                         'dice'
autoload :GameError,                    'errors'
autoload :OutOfRangeError,              'errors'
autoload :MisfireError,                 'errors'
autoload :UnknownDifficultyLevelError,  'errors'
autoload :UnknownWeaponTypeError,       'errors'
autoload :Feat,                         'feat'
autoload :Gun,                          'gun'
autoload :Item,                         'item'
autoload :MartialArt,                   'martial_art'
autoload :MeleeWeapon,                  'melee_weapon'
autoload :Mod,                          'mod'
autoload :RangedWeapon,                 'ranged_weapon'
autoload :Rules,                        'rules'
autoload :Skills,                       'skills'
autoload :Stats,                        'stats'
autoload :Weapon,                       'weapon'

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

puts flip22.price
puts railgun.price
