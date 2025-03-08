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

  def attack!(target:)
    Attack.new(attacker: self, target: target)
    # should return an Attack instance
    # should accept a character as an arg
    # Attack class should implement #with
    # with should take a weapon as an arg
    # and calculate the attack against the target
    # should also implement #at
    # at should take an integer range as a target
    # once the Attack instance has the attacker, target,
    # weapon and range, the attack can be calculated
    # can then move all the attack methods here
    # to the attack class
  end

  def make_check_vs_difficulty_level(difficulty_level:, stat:, skill:)
    modified_roll = make_check(stat: stat, skill: skill)
    calculate_degree_of_success(difficulty_level: difficulty_level, roll: modified_roll)
  end

  def make_ranged_attack(weapon:, range_to_target:)
    result = make_ranged_attack_check_vs_difficulty_level(weapon: weapon, range_to_target: range_to_target)
    return weapon.roll_crit_damge if result == :full
    return weapon.roll_damage if result == :partial
    return 0 if result == :fail
    return -1 if result == :misfire

    raise UnknownDifficultyLevelError
  end

  def make_melee_attack(weapon:)
    result = make_melee_attack_check_vs_difficulty_level(weapon: weapon)
    return weapon.roll_crit_damge if result == :full
    return weapon.roll_damage if result == :partial
    return 0 if result == :fail

    raise UnknownDifficultyLevelError
  end

  private

  def make_ranged_attack_check_vs_difficulty_level(weapon:, range_to_target:)
    raise OutOfRangeError if range_to_target > weapon.max_range

    raw_roll = D20.roll
    return :misfire if weapon.misfired?(roll: raw_roll)

    difficulty_level = weapon.difficulty_level_for_target(range_to_target: range_to_target)
    stat, skill = weapon.stat_and_skill(user: self)
    modified_roll = raw_roll + send(stat) + send(skill)
    calculate_degree_of_success(difficulty_level: difficulty_level, roll: modified_roll)
  end

  def make_melee_attack_check_vs_difficulty_level(weapon:)
    stat, skill = weapon.stat_and_skill(user: self)
    make_check_vs_difficulty_level(difficulty_level: :easy, stat: stat, skill: skill)
  end

  def define_stat_attr_readers
    define_instance_var_attr_readers(obj: stats)
  end

  def define_skill_attr_readers
    define_instance_var_attr_readers(obj: skills)
  end

  def make_check(stat: nil, skill: nil)
    D20.roll + send(stat) + send(skill)
  end

  def calculate_degree_of_success(difficulty_level:, roll:)
    Constants::DIFFICULTY_LEVELS[difficulty_level].each do |degree, range|
      return degree if range.include?(roll)
    end
  end
end
