# frozen_string_literal: true

require 'singleton'

class Rules
  include Singleton

  DIFFICULTY_LEVELS = {
    easy: {
      fail: 1..5,
      partial: 6..15,
      full: 16..Float::INFINITY
    },
    medium: {
      fail: 1..10,
      partial: 11..20,
      full: 21..Float::INFINITY
    },
    hard: {
      fail: 1..15,
      partial: 16..25,
      full: 26..Float::INFINITY
    },
    very_hard: {
      fail: 1..20,
      partial: 21..30,
      full: 31..Float::INFINITY
    },
    nigh_impossible: {
      fail: 1..25,
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

  RANGE_LIMIT_COSTS = RANGE_LIMITS.values.each.with_object({}).with_index do |(v, obj), idx|
    if v == RANGE_LIMITS.values.first
      obj[0..v] = 0.75 * (idx + 1)
      next
    end

    if v == RANGE_LIMITS.values.last
      obj[v..Float::INFINITY] = 0.75 * (idx + 1)
      next
    end

    obj[v..RANGE_LIMITS.values[idx + 1]] = 0.75 * (idx + 1)
  end

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
end
