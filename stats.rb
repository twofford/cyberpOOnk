# frozen_string_literal: true

class Stats
  PRIMARY_STATS = %i[brawn charm intelligence reflexes tech].freeze
  STANDARD_ARRAY = [2, 2, -1, -1, 0].freeze
  MAX_STARTING_LUCK = 3
  DEFAULT_HUMANITY = 5

  attr_reader :brawn, :charm, :intelligence, :reflexes, :tech, :luck, :humanity

  ## All stats except humanity are 0 by default
  def initialize(brawn: 0, charm: 0, intelligence: 0, reflexes: 0, tech: 0, luck: 0, humanity: DEFAULT_HUMANITY)
    @brawn = brawn
    @charm = charm
    @intelligence = intelligence
    @reflexes = reflexes
    @tech = tech
    @luck = luck
    @humanity = humanity
  end

  def self.random
    primary_stats = PRIMARY_STATS.shuffle.each_with_index.map { |stat, i| [stat, STANDARD_ARRAY[i]] }.to_h
    new(**primary_stats.merge({ luck: generate_luck }))
  end

  private

  def generate_luck
    rand(1..MAX_STARTING_LUCK)
  end
end
