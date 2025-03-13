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

Character.new(name: 'Batou', stats: Stats.random, skills: Skills.random)
ammo = Ammo.new(damage_dice: D6, crit_multiplier: 2, quality: 0)
Gun.new(ammo: ammo, reliability: 0, max_range: 50)
MeleeWeapon.new(damage_attributes: DamageAttributes.new(damage_dice: D4, crit_multiplier: 2), mods: [])

### Cybernetics

## For every +1 to a stat or +2 to a skill, -1 humanity
## For every +5 hp, -1 humanity

## Full Body
# Full Body Prosthesis - +10 brawn and reflexes, +50 hp, -30 humanity
# Nanosurgeons 1 - 2x healing rate
# Nanosurgeons 2 - 3x healing rate

## Eyes
# Targeting Optics - +2 marksmanship, -1 humanity
# Full Spectrum Vision - see in all spectra of light, -1 humanity
# Antidazzle - immune to blindness, -1 humanity
# Coordination Suite - allows users to attack with more than one weapon without penalty, -4 humanity

## Ears

## Arms
# Grafted Muscles - +2 brawn, -2 humanity, user can use two-handed weapon with one hand, can be taken twice
# Cyberarm - +2 brawn, +5 hp, -3 humanity, user can use two-handed weapon with one hand, can be taken twice

## Hands
# Gunlink - +2 marksmanship, -1 humanity
# Wolverine Claws - 2d6 damage x3 crit mult, -2 humanity

## Legs
# Grafted Muscles - +2 brawn, +10 speed, -2 humanity
# Cyberleg - +2 brawn, +5 hp, -3 humanity

## Feet

## Anywhere
# Snooper Shielding - snoopers don't work on cyberware in the body part

## Brain
# Reflex Booster 1 - +2 reflexes, +4 initiative, -2 humanity
# Reflex Booster 2 - +2 reflexes, +8 initiative, -4 humanity
# Reflex Booster 3 - +2 reflexes, +12 initiative, -6 humanity
# Postmortem Puppeteer - when you reach 0 hp, you can keep fighting until the end of the encounter, but then you die -10 humanity

## Skin
# Subdermal Armor - +4 DR, -2 huamnity
# Optical Camouflage - +6 stealth, -3 humanity (only helpful if you're naked)
