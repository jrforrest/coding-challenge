require 'rails_helper'

describe 'Adding a founder to a company' do
  let(:company) { create(:company) }

  before do
    visit company_path(company)
    fill_in 'Full name', with: input_name
    fill_in 'Position', with: input_position
    click_save
  end

  shared_examples_for :save_success do
    it 'sends me to the details page' do
      expect(current_path).to eql(company_path(company))
    end

    it 'shows a success message' do
      expect(page).to have_selector('.flash-alert.success')
    end

    it 'shows the new founder' do
      expect(page).
        to have_selector('.founder', text: 'Jack Forrest: Bashtronaut')
    end
  end

  context 'when the form is submitted with valid values' do
    let(:input_name) { 'Jack Forrest' }
    let(:input_position) { 'Bashtronaut' }

    it_behaves_like :save_success
  end

  context 'When the form is submitted with invalid values' do
    let(:input_name) { 'Jack Forrest' }
    let(:input_position) { '' }

    it 'sends me to a new page to correct the mistakes' do
      expect(page).to have_selector('h2', text: 'Derp')
    end

    context 'When I correct the issues and continue' do
      before do
        fill_in 'Position', with: 'Bashtronaut'
        click_save
      end

      it_behaves_like :save_success
    end
  end

  private

  def click_save
    page.find('.new-founder input[type="submit"]').click
  end
end
