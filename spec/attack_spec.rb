# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Attack do
  describe '#make' do
    let(:attacker)  { Character.random }
    let(:target)    { Character.random }
    let(:ammo)      { Ammo.new(damage_dice: D6, crit_multiplier: 2, quality: 0) }
    let(:weapon)    { Gun.new(ammo: ammo, max_range: 50, reliability: 0) }
    let(:attack)    { described_class.new(attacker: attacker, target: target, weapon: weapon, range_to_target: 100) }

    it "raises an error if the weapon's max range is greater than the range to target" do
      expect { attack.make }.to raise_error(OutOfRangeError)
    end
  end
end
