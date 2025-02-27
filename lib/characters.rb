# frozen_string_literal: true

class Character
  DEFAULT_HP = 10

  attr_reader :name, :stats, :skills, :feats, :items, :cybernetics, :hp

  alias hit_points hp
  alias equipment items

  def initialize(name:, stats:, skills:, feats: [], items: [], cybernetics: [])
    @name = name
    @stats = stats
    @skills = skills
    @feats = feats
    @items = items
    @cybernetics = cybernetics
    @hp = DEFAULT_HP + @stats.brawn
  end

  def roll_check_vs_dc(dc:, stat:, skill:)
    modified_roll = roll_check(stat: stat, skill: skill)
    Rules::DIFFICULTY_CLASSES[dc].each do |degree, range|
      return degree if range.include?(modified_roll)
    end
  end

  def roll_attack_check_vs_dc(weapon:, range_to_target:)
    raw_roll = D20.roll
    return :misfire if weapon.misfired?(roll: raw_roll)
    
    dc = weapon.dc_for_target(range_to_target: range_to_target)
    stat, skill = weapon_stat_and_skill(weapon: weapon)
    modified_roll = raw_roll + stats.send(stat) + skills.send(skill)
    Rules::DIFFICULTY_CLASSES[dc].each do |degree, range|
      return degree if range.include?(modified_roll)
    end
  end

  def make_ranged_attack(weapon:, range_to_target:)
    result = roll_attack_check_vs_dc(weapon: weapon, range_to_target: range_to_target)
    case result
    when :full
      "Crit! #{weapon.roll_damage(crit: true)} damage"
    when :partial
      "Hit! #{weapon.roll_damage} damage"
    when :fail
      "Miss!"
    when :misfire
      "Misfire!"
    else
      nil
    end
  end

  private

  def roll_check(stat: nil, skill: nil)
    D20.roll + stats.send(stat) + skills.send(skill)
  end

  def roll_attack_check(weapon:)
    stat, skill = weapon_stat_and_skill(weapon: weapon)
    roll_check(stat: stat, skill: skill)
  end

  def weapon_stat_and_skill(weapon:)
    return %i[reflexes marksmanship] if weapon.is_a?(Gun)
    return [best_of(:brawn, :reflexes), :melee_combat] if weapon.is_a?(MeleeWeapon)
    return [best_of(:brawn, :reflexes), :martial_arts] if weapon.is_a?(MartialArt)

    raise NotImplementedError
  end

  def best_of(stat1, stat2)
    stats.send(stat1) > stats.send(stat2) ? stat1 : stat2
  end
end
