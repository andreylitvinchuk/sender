require 'rails_helper'

RSpec.describe NewsletterForm, type: :form do
  let(:newsletter) {Newsletter.new}
  let(:newsletter_form) {NewsletterForm.new(newsletter)}

  it 'should ba valid' do
    newsletter_form.validate(
      name: 'newsletter',
      filters: [
        { prop_name: 'level', logic: 'qteq', value: '10' },
        { prop_name: 'level', logic: 'lteq', value: '12' }
      ],
      start_at: DateTime.now
    )
    expect(newsletter_form).to be_valid
  end

  it 'should require name' do
    newsletter_form.validate({})
    expect(newsletter_form.errors[:name]).to include("can't be blank")
  end

  it 'should require start_at' do
    newsletter_form.validate({})
    expect(newsletter_form.errors[:start_at]).to include("can't be blank")
  end

  it 'should response text' do
    expect(newsletter_form).to respond_to :text
  end

  context 'require filters' do

    it 'presence' do
      newsletter_form.validate({})
      expect(newsletter_form.errors[:filters]).to include("can't be blank")
    end

    it 'be array' do
      newsletter_form.validate(filters: 'string')
      expect(newsletter_form.errors[:filters]).to include('should be array')
    end

    it 'element have key prop_name' do
      newsletter_form.validate(filters: [{wrong_key: 'value'}])
      expect(newsletter_form.errors[:filters]).to include('should contain key prop_name')
    end

    it 'element have logic' do
      newsletter_form.validate(filters: [{wrong_key: 'value'}])
      expect(newsletter_form.errors[:filters]).to include('should contain key logic')
    end

    it 'element have value' do
      newsletter_form.validate(filters: [{wrong_key: 'value'}])
      expect(newsletter_form.errors[:filters]).to include('should contain key value')
    end

  end

end