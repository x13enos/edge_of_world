require 'rails_helper'

RSpec.describe Character, type: :model do

  it { should belong_to(:user) }

  context "custom validations" do
    describe "only_one_active_character" do
      let(:user) { create(:user) }

      it 'should return error' do
        create(:character, :user_id => user.id, :active => true)
        allow(I18n).to receive(:t).with('models.users.validations.base.just_one_character') { 'error' }
        character = build(:character, :user_id => user.id)
        character.valid?
        expect(character.errors[:base]).to eq(['error'])
      end

      it 'should return error' do
        character = build(:character, :user_id => user.id)
        character.valid?
        expect(character.errors[:base]).to be_empty
      end
    end
  end
end

