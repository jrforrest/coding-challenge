require 'rails_helper'

describe Company do
  context 'when missing a required field' do
    subject { build(:company, founded_at: nil) }

    it { is_expected.to be_invalid }
  end

  context 'when generated with a factory' do
    subject { build(:company) }

    it('is valid') { expect(subject).to be_valid }

    context 'when saved' do
      before { subject.save }
      it('is persisted') { expect(subject).to be_persisted }
    end
  end
end
