# frozen_string_literal: true

class Skills
  DEFAULT_STARTING_SKILL_POINTS = 10
  MAX_STARTING_SKILL_LEVEL = 5

  attr_reader :athleticism, :awareness, :connections, :deception, :driving, :engineering, :explosives, :hacking,
              :influence, :intimidation, :investigation, :marksmanship, :martial_arts, :medicine, :melee_combat,
              :piloting, :seduction, :stealth, :street_smarts, :tracking

  # All skills are 0 by default
  def initialize(
    athleticism: 0,
    awareness: 0,
    connections: 0,
    deception: 0,
    driving: 0,
    engineering: 0,
    explosives: 0,
    hacking: 0,
    influence: 0,
    intimidation: 0,
    investigation: 0,
    marksmanship: 0,
    martial_arts: 0,
    medicine: 0,
    melee_combat: 0,
    piloting: 0,
    seduction: 0,
    stealth: 0,
    street_smarts: 0,
    tracking: 0
  )
    @athleticism = athleticism
    @awareness = awareness
    @connections = connections
    @deception = deception
    @driving = driving
    @engineering = engineering
    @explosives = explosives
    @hacking = hacking
    @influence = influence
    @intimidation = intimidation
    @investigation = investigation
    @marksmanship = marksmanship
    @martial_arts = martial_arts
    @medicine = medicine
    @melee_combat = melee_combat
    @piloting = piloting
    @seduction = seduction
    @stealth = stealth
    @street_smarts = street_smarts
    @tracking = tracking
  end

  def self.random
    skills = new.instance_variables.map { |var| var.to_s.delete_prefix('@').to_sym }
    skill_mods = skills.each_with_object({}) { |skill, hash| hash[skill] = 0 }
    DEFAULT_STARTING_SKILL_POINTS.times do
      available_skills = skills.select { |skill| skill_mods[skill] < MAX_STARTING_SKILL_LEVEL }
      random_skill = available_skills.sample
      skill_mods[random_skill] += 1
    end
    new(**skill_mods)
  end
end
