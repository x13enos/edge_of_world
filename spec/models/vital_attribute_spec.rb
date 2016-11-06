require 'rails_helper'

RSpec.describe VitalAttribute, type: :model do

  it { should belong_to(:character) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:max_value) }
  it { should validate_inclusion_of(:name).in_array(VitalAttribute::TYPES) }

end

