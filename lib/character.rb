# frozen_string_literal: true

class Character
  DEFAULT_HP = 10

  attr_reader :name, :stats, :skills, :feats, :items, :cybernetics, :hp

  alias hit_points hp
  alias equipment items
  alias cyberware cybernetics

  def initialize(name:, stats:, skills:, feats: [], items: [], cybernetics: [])
    @name = name
    @stats = stats
    @skills = skills
    @feats = feats
    @items = items
    @cybernetics = cybernetics

    # Allows `brawn`, `marksmanship`
    # Instead of `stats.brawn`, `skills.marksmanship`
    define_stat_attr_readers
    define_skill_attr_readers

    @hp = DEFAULT_HP + brawn
  end


  private

  def define_stat_attr_readers
    define_instance_var_attr_readers(obj: stats)
  end

  def define_skill_attr_readers
    define_instance_var_attr_readers(obj: skills)
  end
end
