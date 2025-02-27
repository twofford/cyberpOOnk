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

  def attack_with(weapon:)
    weapon.attack_roll(bonus: calculate_attack_bonus(weapon: weapon))
  end

  private

  def calculate_attack_bonus(weapon:)
    return gun_attack_bonus if weapon.is_a?(Gun)
    return melee_weapon_attack_bonus if weapon.is_a?(MeleeWeapon)
    return martial_art_attack_bonus if weapon.is_a?(MartialArt)

    raise NotImplementedError
  end

  def gun_attack_bonus
    stats.reflexes + skills.marksmanship
  end

  def melee_weapon_attack_bonus
    [stats.brawn, stats.reflexes].max + skills.melee_combat
  end

  def martial_art_attack_bonus
    [stats.brawn, stats.reflexes].max + skills.martial_arts
  end
end
