require 'rails_helper'

describe Game::Characters::Creating do

  describe 'validations' do
    describe 'only_one_active_character' do
      let(:user) { create(:user) }
      let(:builder) do
        Game::Characters::Creating.new(user)
      end

      before do
      end

      context 'when user has active character' do
        before do
          allow(user).to receive(:active_character) { true }
        end

        it 'should have :just_one_active_character on :base' do
          builder.valid?
          expect(builder.errors.added?(:base, :just_one_active_character)).to be(true)
        end
      end

      context 'when user does not have active character' do
        before do
          allow(user).to receive(:active_character) { false }
        end

        it 'should have not :just_one_active_character on :base' do
          builder.valid?
          expect(builder.errors.added?(:base, :just_one_active_character)).to be(false)
        end
      end
    end
  end

  describe ".initialize" do
    let(:user) { create(:user) }
    let(:builder) do
      Game::Characters::Creating.new(user)
    end

    it 'should return user for builder' do
      expect(builder.user).to eq(user)
    end
  end

  describe ".perform" do
    let(:user) { create(:user) }
    let(:builder) do
      Game::Characters::Creating.new(user)
    end

    context 'when character valid' do
      before do
        allow(builder).to receive(:valid?) { true }
      end

      it 'should create character for user' do
        builder.perform
        expect(user.characters.count).to eq(1)
      end

      it 'should create vital attributes for character' do
        builder.perform
        expect(user.reload.active_character.vital_attributes.count).to eq(VitalAttribute::TYPES.count)
      end

      context "check the keeping the correct data for the vital attribute" do
        before do
          builder.perform
          @type_of_attribute = VitalAttribute::TYPES.first
          @vital_attribute = VitalAttribute.find_by(:name => @type_of_attribute)
        end

        it 'should return the correct name' do
          expect(@vital_attribute.name).to eq(@type_of_attribute)
        end

        it 'should return the correct max_value' do
          expect(@vital_attribute.max_value).to eq(VitalAttribute::MAX_VALUE[@type_of_attribute])
        end

        it 'should return the correct value' do
          expect(@vital_attribute.value).to eq(VitalAttribute::MAX_VALUE[@type_of_attribute])
        end
      end
    end

    context 'when character invalid' do
      before do
        allow(builder).to receive(:valid?) { false }
      end

      it 'should return false' do
        expect(builder.perform).to be_falsey
      end
    end
  end
end
