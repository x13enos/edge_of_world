require 'rails_helper'

RSpec.describe Character, type: :model do

  it { should belong_to(:user) }
  it { should have_many(:vital_attributes) }

end
