require 'rails_helper'

describe 'Editing a company' do
  let(:company) { create(:company) }

  before { visit edit_company_path(company) }

  describe 'The edit page' do
    subject { page }

    it { is_expected.to have_selector('h2', text: "Edit #{company.name}") }
  end

  context 'With valid values submitted' do
    before do
      fill_in :City, with: 'Seattle'
      fill_in :State, with: 'Washington'
      click_button 'save'
    end

    it 'takes me to the company details page and shows a message' do
      expect(page).to have_selector('.flash-alert.success')
      expect(current_path).to eql(company_path(company))
    end

    it 'updates the companies details on the edit page' do
      expect(page).to have_selector('.location', text: 'Seattle, Washington')
    end
  end

  context 'with a blank required value submitted' do
    before do
      fill_in :Name, with: ''
      click_button 'save'
    end

    it 'shows validation errors' do
      expect(page).to have_selector(".company_name .error")
    end
  end
end
