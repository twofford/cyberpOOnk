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

flip22 = Gun.new(
  ammo: Ammo.new(damage_die: D6, crit_multiplier: 2, quality: -1),
  max_range: 50,
  reliability: 10
)

knife = MeleeWeapon.new(
  damage_attributes: DamageAttributes.new(
    damage_die: D6,
    crit_multiplier: 2
  )
)

mook_stats = Stats.new(
  brawn: 1,
  reflexes: 1
)

mook_skills = Skills.new(
  intimidation: 1,
  marksmanship: 1,
  melee_combat: 1,
  martial_arts: 1,
  street_smarts: 1
)

# Make 5 mooks
mooks = (1..5).collect do |i|
  Character.new(
    name: "Mook #{i}",
    stats: mook_stats,
    skills: mook_skills,
    items: [flip22, knife]
  )
end

puts mooks.first.make_ranged_attack(weapon: flip22, range_to_target: 10)
