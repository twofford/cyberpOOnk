# frozen_string_literal: true

$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/lib"

require 'characters'
require 'cybernetics'
require 'dice'
require 'feats'
require 'items'
require 'rules'
require 'skills'
require 'stats'
require 'utility'

flip22 = Gun.new(
  ammo: Ammo.new(damage_die: D6, crit_multiplier: 2),
  max_range: 50,
  reliability: 10
)

batou = Character.new(name: 'Batou', stats: Stats.random, skills: Skills.random)

puts batou.make_ranged_attack(weapon: flip22, range_to_target: 10)
