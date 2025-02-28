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

  def roll_check_vs_difficulty_level(difficulty_level:, stat:, skill:)
    modified_roll = roll_check(stat: stat, skill: skill)

    calculate_degree_of_success(difficulty_level: difficulty_level, roll: modified_roll)
  end

  def make_ranged_attack(weapon:, range_to_target:)
    result = roll_ranged_attack_check_vs_difficulty_level(weapon: weapon, range_to_target: range_to_target)
    case result
    when :full
      weapon.roll_crit_damge
    when :partial
      weapon.roll_damage
    when :fail
      0
    when :misfire
      -1
    else
      raise NotImplementedError
    end
  end

  def make_melee_attack(weapon:)
    result = roll_melee_attack_check_vs_difficulty_level(weapon: weapon)
    case result
    when :full
      weapon.roll_crit_damge
    when :partial
      weapon.roll_damage
    when :fail
      0
    else
      raise NotImplementedError
    end
  end

  private

  def roll_ranged_attack_check_vs_difficulty_level(weapon:, range_to_target:)
    raw_roll = D20.roll
    return :misfire if weapon.misfired?(roll: raw_roll)

    difficulty_level = weapon.difficulty_level_for_target(range_to_target: range_to_target)
    stat, skill = weapon.stat_and_skill(user: self)

    # stat and skill are defined by define_stat_attr_reader and define_skill_attr_reader in the constructor
    modified_roll = raw_roll + stat + skill

    calculate_degree_of_success(difficulty_level: difficulty_level, roll: modified_roll)
  end

  def roll_melee_attack_check_vs_difficulty_level(weapon:)
    stat, skill = weapon.stat_and_skill(user: self)
    roll_check_vs_difficulty_level(difficulty_level: :easy, stat: stat, skill: skill)
  end

  def define_stat_attr_readers
    define_instance_var_attr_readers(obj: stats)
  end

  def define_skill_attr_readers
    define_instance_var_attr_readers(obj: skills)
  end

  def roll_check(stat: nil, skill: nil)
    # stat and skill are defined by define_stat_attr_reader and define_skill_attr_reader in the constructor
    D20.roll + stat + skill
  end

  def calculate_degree_of_success(difficulty_level:, roll:)
    Rules::DIFFICULTY_LEVELS[difficulty_level].each do |degree, range|
      return degree if range.include?(roll)
    end
  end
end
