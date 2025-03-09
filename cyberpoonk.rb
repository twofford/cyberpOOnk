# frozen_string_literal: true

$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/lib"

require 'utility'

autoload :Ammo,                         'ammo'
autoload :Armor,                        'armor'
autoload :Attack,                       'attack'
autoload :Character,                    'character'
autoload :Check,                        'check'
autoload :Constants,                    'constants'
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
autoload :UnknownDegreeOfSuccessError,  'errors'
autoload :UnknownWeaponTypeError,       'errors'
autoload :Feat,                         'feat'
autoload :Gun,                          'gun'
autoload :Item,                         'item'
autoload :MartialArt,                   'martial_art'
autoload :MeleeAttack,                  'melee_attack'
autoload :MeleeWeapon,                  'melee_weapon'
autoload :Mod,                          'mod'
autoload :RangedAttack,                 'ranged_attack'
autoload :RangedWeapon,                 'ranged_weapon'
autoload :Skills,                       'skills'
autoload :Stats,                        'stats'
autoload :Weapon,                       'weapon'

### Example usage

char = Character.new(name: 'Batou', stats: Stats.random, skills: Skills.random)
ammo = Ammo.new(damage_dice: D6, crit_multiplier: 2, quality: 0)
gun = Gun.new(ammo: ammo, reliability: 0, max_range: 50)
knife = MeleeWeapon.new(damage_attributes: DamageAttributes.new(damage_dice: D4, crit_multiplier: 2), mods: [])

puts Attack.new(attacker: char, target: char, range_to_target: 10, weapon: gun, modifiers: []).make
puts RangedAttack.new(attacker: char, target: char, range_to_target: 10, weapon: gun, modifiers: []).make
puts MeleeAttack.new(attacker: char, target: char, weapon: knife, modifiers: []).make
