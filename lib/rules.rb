# frozen_string_literal: true

require 'singleton'

class Rules
  include Singleton

  DIFFICULTY_CLASSES = {
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

  VALID_DICE_SIZES = [4, 6, 8, 10, 12, 20, 100].freeze
  VALID_CRIT_MULTIPLIERS = [2, 3, 4, 5, 6].freeze
end
