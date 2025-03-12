# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Character do
  let(:character) { described_class.random }

  describe 'dynamic stat attr_readers' do
    it 'responds to brawn' do
      expect { character.brawn }.not_to raise_error
    end

    it 'responds to charm' do
      expect { character.charm }.not_to raise_error
    end

    it 'respons to intelligence' do
      expect { character.intelligence }.not_to raise_error
    end

    it 'responds to reflexes' do
      expect { character.reflexes }.not_to raise_error
    end

    it 'responds to tech' do
      expect { character.tech }.not_to raise_error
    end

    it 'responds to luck' do
      expect { character.luck }.not_to raise_error
    end

    it 'responds to humanity' do
      expect { character.humanity }.not_to raise_error
    end
  end

  describe 'dynamic skill attr_readers' do
    it 'responds to athleticism' do
      expect { character.athleticism }.not_to raise_error
    end

    it 'responds to awareness' do
      expect { character.awareness }.not_to raise_error
    end

    it 'responds to connections' do
      expect { character.connections }.not_to raise_error
    end

    it 'responds to deception' do
      expect { character.deception }.not_to raise_error
    end

    it 'responds to driving' do
      expect { character.driving }.not_to raise_error
    end

    it 'responds to engineering' do
      expect { character.engineering }.not_to raise_error
    end

    it 'responds to explosives' do
      expect { character.explosives }.not_to raise_error
    end

    it 'responds to hacking' do
      expect { character.hacking }.not_to raise_error
    end

    it 'responds to influence' do
      expect { character.influence }.not_to raise_error
    end

    it 'responds to intimidation' do
      expect { character.intimidation }.not_to raise_error
    end

    it 'responds to investigation' do
      expect { character.investigation }.not_to raise_error
    end

    it 'responds to marksmanship' do
      expect { character.marksmanship }.not_to raise_error
    end

    it 'responds to martial_arts' do
      expect { character.martial_arts }.not_to raise_error
    end

    it 'responds to medicine' do
      expect { character.medicine }.not_to raise_error
    end

    it 'responds to melee_combat' do
      expect { character.melee_combat }.not_to raise_error
    end

    it 'responds to piloting' do
      expect { character.piloting }.not_to raise_error
    end

    it 'responds to seduction' do
      expect { character.seduction }.not_to raise_error
    end

    it 'responds to stealth' do
      expect { character.stealth }.not_to raise_error
    end

    it 'responds to street_smarts' do
      expect { character.street_smarts }.not_to raise_error
    end

    it 'responds to tracking' do
      expect { character.tracking }.not_to raise_error
    end
  end
end
