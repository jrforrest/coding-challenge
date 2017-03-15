require 'rails_helper'

describe Tag do
  subject { build(:tag) }

  it { is_expected.to be_valid }
end
