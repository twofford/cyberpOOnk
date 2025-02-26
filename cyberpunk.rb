# frozen_string_literal: true

class Rules
  DCS =
    {
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
end

class Weapon
  attr_reader :max_range

  def initialize(max_range:)
    @max_range = max_range
  end

  def hit?(range:, roll:)
    return true if melee? && roll >= Rules::DCS[:easy][:partial].first

    return false if range > max_range

    difficulty = to_hit_ranges.find { |_, r| r.include?(range) }.first
    # puts "quartile_width: #{quartile_width}" ## Comment in for debugging
    # puts "to hit ranges: #{to_hit_ranges}" ## Comment in for debugging
    #puts "difficulty: #{difficulty}"  ## Comment in for debugging
    Rules::DCS[difficulty].find { |_, r| r.include?(roll) }.first
  end

  private

  def y
    (max_range - 10).to_f
  end

  def quartile_width
    y / 4
  end

  def easy_range
    1..10
  end

  def medium_range
    11..(10 + quartile_width).round
  end

  def hard_range
    (medium_range.end + 1)..(10 + quartile_width * 2).round
  end

  def very_hard_range
    (hard_range.end + 1)..(10 + quartile_width * 3).round
  end

  def nigh_impossible_range
    (very_hard_range.end + 1)..max_range
  end

  def to_hit_ranges
    {
      easy: easy_range,
      medium: medium_range,
      hard: hard_range,
      very_hard: very_hard_range,
      nigh_impossible: nigh_impossible_range
    }
  end

  def melee?
    max_range.zero?
  end
end
