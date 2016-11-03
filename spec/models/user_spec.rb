require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_one(:active_character).conditions(:active => true) }
  it { should have_many(:characters) }


end
