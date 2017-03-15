require 'rails_helper'

describe Founder do
  context 'when it has no company' do
    subject { build(:founder, company: nil) }

    it { is_expected.to_not be_valid }
  end

  context 'when it has no full name' do
    subject { build(:founder, full_name: nil) }

    it { is_expected.to_not be_valid }
  end

  context 'when it has no position' do
    subject { build(:founder, position: nil) }

    it { is_expected.to_not be_valid }
  end
end
