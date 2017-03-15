require 'rails_helper'

describe 'Viewing company details' do
  let!(:company) { create(:company, :with_founders, :with_tags) }

  describe 'clicking a company name from the home page' do
    before do
      visit '/'
      click_link company.name
    end

    it 'brings me to company detail by clicking a company name' do
      expect(current_path).to eql(company_path(company))
    end
  end

  describe 'the company detail page' do
    include ApplicationHelper

    let(:location_string) { company_location(company) }
    let(:date_string) { date(company.founded_at) }
    let(:description_string) { company.description.gsub("\n", ' ') }
    let(:founder_string) do
      f = company.founders.first
      "#{f.full_name}: #{f.position}"
    end
    let(:tag_string) { company.tags.first.name }

    before { visit company_path(company) }
    subject { page }

    it { is_expected.to have_selector('.location', text: location_string) }
    it { is_expected.to have_selector('.name', text: company.name) }
    it { is_expected.to have_selector('.founded_at', text: date_string) }
    it { is_expected.to have_selector('.description', text: description_string) }
    it { is_expected.to have_selector('.founder', text: founder_string) }
    it { is_expected.to have_selector('.tag', text: tag_string) }

    context 'when the edit button is clicked' do
      before { click_link 'Edit' }

      it 'takes me to the edit page' do
        expect(current_path).to eql(edit_company_path(company))
      end
    end
  end

  describe 'deleting a company' do
    before do
      visit company_path(company)
      click_link 'Delete'
    end

    it 'takes me the index' do
      expect(current_path).to eql(root_path)
    end

    it 'deletes the compay' do
      expect(page).to have_no_selector('.name', text: company.name)
    end

    it 'notifies me of success' do
      expect(page).to have_selector('.flash-alert.success')
    end
  end
end
