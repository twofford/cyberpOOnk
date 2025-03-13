# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gun do
  describe '#misfire_range' do
    let(:bad_ammo) { Ammo.new(damage_dice: D6, crit_multiplier: 2, quality: -3) }
    let(:good_ammo) { Ammo.new(damage_dice: D6, crit_multiplier: 2, quality: 3) }
    let(:average_ammo) { Ammo.new(damage_dice: D6, crit_multiplier: 2, quality: 0) }
    let(:bad_gun) { described_class.new(ammo: bad_ammo, max_range: 50, reliability: -3) }
    let(:good_gun) { described_class.new(ammo: good_ammo, max_range: 50, reliability: 3) }
    let(:average_gun) { described_class.new(ammo: average_ammo, max_range: 50, reliability: 0) }

    it 'is between 1 and 11' do
      expect(bad_gun.send(:misfire_range)).to eq(1..11)
      expect(good_gun.send(:misfire_range)).to eq(1..1)
      expect(average_gun.send(:misfire_range)).to eq(1..5)
    end
  end

  describe '#misfired?' do
    let(:ammo) { Ammo.new(damage_dice: D6, crit_multiplier: 2, quality: 0) }
    let(:gun) { described_class.new(ammo: ammo, max_range: 50, reliability: 0) }

    it 'returns true if the gun misfired' do
      expect(gun.send(:misfired?, roll: 5)).to be(true)
    end

    it 'returns false if the gun did not misfire' do
      expect(gun.send(:misfired?, roll: 10)).to be(false)
    end
  end
end
