# frozen_string_literal: true

require 'singleton'

class Constants
  include Singleton

  DIFFICULTY_LEVELS = {
    easy: {
      fail: -Float::INFINITY..5,
      partial: 6..15,
      full: 16..Float::INFINITY
    },
    medium: {
      fail: -Float::INFINITY..10,
      partial: 11..20,
      full: 21..Float::INFINITY
    },
    hard: {
      fail: -Float::INFINITY..15,
      partial: 16..25,
      full: 26..Float::INFINITY
    },
    very_hard: {
      fail: -Float::INFINITY..20,
      partial: 21..30,
      full: 31..Float::INFINITY
    },
    nigh_impossible: {
      fail: -Float::INFINITY..25,
      partial: 26..35,
      full: 36..Float::INFINITY
    }
  }.freeze

  RANGE_LIMITS = {
    easy: 15,
    medium: 45,
    hard: 75,
    very_hard: 150,
    nigh_impossible: 300
  }.freeze

  EASY_RANGE = 0..RANGE_LIMITS[:easy]

  MEDIUM_RANGE = (RANGE_LIMITS[:easy] + 1)..RANGE_LIMITS[:medium]

  HARD_RANGE = (RANGE_LIMITS[:medium] + 1)..RANGE_LIMITS[:hard]

  VERY_HARD_RANGE = (RANGE_LIMITS[:hard] + 1)..RANGE_LIMITS[:very_hard]

  NIGH_IMPOSSIBLE_RANGE = (RANGE_LIMITS[:very_hard] + 1)..RANGE_LIMITS[:nigh_impossible]

  IMPOSSIBLE_RANGE = (RANGE_LIMITS[:nigh_impossible] + 1)..Float::INFINITY

  RANGED_ATTACK_DLS = {
    easy: EASY_RANGE,
    medium: MEDIUM_RANGE,
    hard: HARD_RANGE,
    very_hard: VERY_HARD_RANGE,
    nigh_impossible: NIGH_IMPOSSIBLE_RANGE,
    impossible: IMPOSSIBLE_RANGE
  }.freeze

  RANGE_LIMIT_COSTS = {
    0..15 => 0.75,
    45..75 => 1.5,
    75..150 => 2.25,
    150..300 => 3.0,
    300..Float::INFINITY => 3.75
  }.freeze

  DAMAGE_DICE_COSTS = {
    D4: 20_000,
    D6: 35_000,
    D8: 50_000,
    D10: 75_000,
    D12: 120_000,
    D20: 650_000
  }.freeze

  CRIT_MULTIPLIER_COSTS = {
    2 => 1,
    3 => 2,
    4 => 3,
    5 => 4,
    6 => 5
  }.freeze

  AMMO_QUALITY_COSTS = {
    -3 => 0.25,
    -2 => 0.5,
    -1 => 0.75,
    0 => 1,
    1 => 1.25,
    2 => 1.5,
    3 => 1.75
  }.freeze

  RELIABILITY_COSTS = {
    -3 => 0.25,
    -2 => 0.5,
    -1 => 0.75,
    0 => 1,
    1 => 1.25,
    2 => 1.5,
    3 => 1.75
  }.freeze

  COVER_TYPES = {
    LIGHT: -5,
    MEDIUM: -10,
    HEAVY: -15
  }.freeze
end
