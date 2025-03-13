# frozen_string_literal: true

class AttackModifiers < CheckModifiers
  def self.akimbo
    -15
  end

  def self.aimed
    +10
  end

  def self.target_behind_cover(type:)
    return -5 if type == Constants::COVER_TYPES[LIGHT]
    return -10 if type == Constants::COVER_TYPES[MEDIUM]
    return -15 if type == Constants::COVER_TYPES[HEAVY]

    raise UnknownCoverTypeError
  end

  def self.quick_attack
    -10
  end

  def self.blinded
    -20
  end
end
