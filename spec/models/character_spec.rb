require 'rails_helper'

RSpec.describe Character, type: :model do

  it { should belong_to(:user) }

  context "custom validations" do
    describe "only_one_active_character" do
      let(:user) { create(:user) }

      it 'should return number of errors by :base key eq 1' do
        create(:character, :user_id => user.id, :active => true)
        character = build(:character, :user_id => user.id)
        character.valid?
        expect(character.errors[:base].count).to eq(1)
      end

      it 'should return number of errors by :base key eq 0' do
        character = build(:character, :user_id => user.id)
        character.valid?
        expect(character.errors[:base].count).to eq(0)
      end
    end
  end
end

