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

batou = Character.new(name: 'Batou', stats: Stats.random, skills: Skills.random)

puts batou.inspect
