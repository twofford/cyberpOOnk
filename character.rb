# frozen_string_literal: true

class Character
  attr_reader :name, :stats, :skills, :feats, :items, :cybernetics

  def initialize(name:, stats:, skills:, feats: [], items: [], cybernetics: [])
    @name = name
    @stats = stats
    @skills = skills
    @feats = feats
    @items = items
    @cybernetics = cybernetics
  end
end
