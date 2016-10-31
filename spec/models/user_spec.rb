require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many(:characters) }

  describe "#character" do
    let(:user) { create(:user) }
    let(:character) { create(:character, :user_id => user.id, :active => true) }

    it 'should return active character' do
      character
      expect(user.character).to eq(character)
    end

    it 'should return nil' do
      expect(user.character).to be_nil
    end
  end

end
