require 'rails_helper'

describe 'The company listing page' do
  let!(:companies) { create_list(:company, 5) }

  before { visit '/' }

  it 'has a listing of the companies' do
    expect(page.all('article.company').count).to eql(5)
  end

  describe 'one of the listed companies' do
    let(:company) { companies.first }
    let(:stripped_description) { company.description.gsub("\n", ' ') }
    subject { page.all('article.company').first }

    it 'has the company name' do
      expect(subject.find('.name').text).to eql(company.name)
    end

    it 'has the company description' do
      expect(subject.find('.description').text).to eql(stripped_description)
    end

    it 'has the company location' do
      expect(subject.find('.location').text)
        .to eql("#{company.city}, #{company.state}")
    end
  end
end
