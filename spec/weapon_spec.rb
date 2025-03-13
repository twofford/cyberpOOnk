# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Weapon do
  describe '#calculate_price' do
    context 'when it is a melee weapon' do
      let(:weapon) { MeleeWeapon.new(damage_attributes: DamageAttributes.new(damage_dice: 2 * D6, crit_multiplier: 3)) }

      it 'calculates the price without ammo quality, max range or reliability' do
        # Base cost: 2 * D6 = 70,000
        # Crit multiplier: 3 = * 2 cost
        # 70,000 * 2 = 140,000
        expect(weapon.calculate_price).to eq(140_000)
      end
    end

    context 'when it is a gun' do
      let(:weapon) do
        Gun.new(ammo: Ammo.new(damage_dice: 3 * D8, crit_multiplier: 4, quality: -1), max_range: 100, reliability: 1)
      end

      # Base cost: 3 * D8 = 150,000
      # Crit multiplier: 4 = * 3 cost
      # Ammo quality: -1 = * 0.75 cost
      # Max range: 100 = * 2.25 cost
      # Reliability: 1 = * 1.25 cost
      # 150,000 * 3 * 0.75 * 2.25 * 1.25 = 949218.75
      # To nearest hundred = 949,200
      it 'calculates the price with ammo quality, max range and reliability' do
        expect(weapon.calculate_price).to eq(949_200)
      end
    end
  end
end
