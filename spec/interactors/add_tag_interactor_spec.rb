require 'rails_helper'

describe AddTagInteractor do
  let(:company) { create(:company) }
  let(:tag_params) { { name: tag_name } }
  let(:tag_name) { 'groovy' }
  let(:tags_with_name) { Tag.where(name: tag_name) }

  subject do
    AddTagInteractor.new(company: company, tag_params: tag_params)
  end

  context 'when the tag does not yet exist' do
    it 'returns true' do
      expect(subject.add_tag).to be_truthy
    end

    it 'creates the tag' do
      subject.add_tag
      expect(tags_with_name.count).to eql(1)
    end
  end

  context 'when another company has the tag' do
    let(:existing_tag) { create(:tag, name: tag_name) }
    let!(:other_company) { create(:company).tap {|c| c.tags << existing_tag } }

    before { subject.add_tag }

    it 'adds the tag to the given company' do
      expect(company.tags).to include(existing_tag)
    end

    it 'does not duplicate the tag' do
      expect(tags_with_name.count).to eql(1)
    end
  end

  context 'when the company already has the tag' do
    before do
      company.tags << create(:tag, name: tag_name)
      subject.add_tag
    end

    it 'returns falsy' do
      expect(subject.add_tag).to be_falsy
    end

    it 'does not re-create the tag' do
      expect(tags_with_name.count).to eql(1)
    end
  end

  context 'when the tag is invalid' do
    let(:tag_name) { '' }

    it 'returns falsy' do
      expect(subject.add_tag).to be_falsy
    end

    it 'does not create the tag' do
      expect(tags_with_name.count).to eql(0)
    end
  end
end
