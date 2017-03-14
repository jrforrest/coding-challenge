require 'rails_helper'

describe 'The company create page' do
  before { visit new_company_path }

  VALID_VALUES = {
    'Name' => 'Aww yeah Inc.',
    'City' => 'Everett',
    'State' => 'WA',
    'Founded at' => 'March 2016',
    'Description' => 'It really is very nice.'
  }

  context 'with valid values submitted' do
    let(:values) { valid_values }

    before { submit_filled_in_form }

    it 'submits the form and shows the new company' do
      expect(page).to have_selector('.flash-alert.success')
      expect(page).to have_selector('article.company', count: 1)
    end
  end

  VALID_VALUES.each do |name, _|
    context "with #{name} missing" do
      let(:values) { valid_values.tap {|h| h[name] = ''} }
      let(:input_class) { 'company_' + name.downcase.gsub(' ', '_') }

      before { submit_filled_in_form }

      it "notifies that the user that #{name} is required" do
        expect(page).to have_selector(".#{input_class} .error")
      end
    end
  end

  private

  def valid_values
    VALID_VALUES.clone
  end

  def submit_filled_in_form(given_values = nil)
    fill_in_form
    click_button 'save'
  end

  def fill_in_form
    values.each {|k,v| fill_in k, with: v }
  end
end
