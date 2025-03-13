# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Gun do
  describe '#misfire_range' do
    let(:bad_gun) do
      described_class.new(ammo: Ammo.new(damage_dice: D6, crit_multiplier: 2, quality: -3), max_range: 50,
                          reliability: -3)
    end
    let(:good_gun) do
      described_class.new(ammo: Ammo.new(damage_dice: D6, crit_multiplier: 2, quality: 3), max_range: 50,
                          reliability: 3)
    end
    let(:average_gun) do
      described_class.new(ammo: Ammo.new(damage_dice: D6, crit_multiplier: 2, quality: 0), max_range: 50,
                          reliability: 0)
    end

    it 'is between 1 and 11 when reliability and ammo quality are at minimum' do
      expect(bad_gun.send(:misfire_range)).to eq(1..11)
    end

    it 'is between 1 and 1 when reliability and ammo quality are at maximum' do
      expect(good_gun.send(:misfire_range)).to eq(1..1)
    end

    it 'is between 1 and 5 when reliability and ammo quality are average' do
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
