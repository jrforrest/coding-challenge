require 'rails_helper'

describe 'Adding a tag to a company' do
  let(:company) { create(:company) }
  let(:tag_name) { "Holy Tag!" }

  before { visit company_path(company) }

  shared_examples_for :save_success do
    it 'sends me to the details page' do
      expect(current_path).to eql(company_path(company))
    end

    it 'shows a success message' do
      expect(page).to have_selector('.flash-alert.success')
    end

    it 'shows the new tag' do
      expect(page).to have_selector('.tag', text: tag_name)
    end
  end

  shared_examples_for :save_failure do
    it 'sends me to the details page' do
      expect(current_path).to eql(company_path(company))
    end

    it 'shows a failure message' do
      expect(page).to have_selector('.flash-alert.failure')
    end
  end

  context 'with a valid tag' do
    before { submit_tag }

    it_behaves_like :save_success
  end

  context 'with a duplicate tag' do
    before do
      company.tags << create(:tag, name: tag_name)
      submit_tag
    end

    it_behaves_like :save_failure
  end

  context 'with an invalid tag' do
    let(:tag_name) { ''}
    before { submit_tag }

    it_behaves_like :save_failure
  end

  private

  def submit_tag
    fill_in 'Name', with: tag_name
    page.find('.new-tag input[type="submit"]').click
  end
end
