RSpec.describe EmailValidator do
  class TestEmailValidatorModel
    include ActiveModel::Model

    attr_accessor :email

    validates_with EmailValidator, attributes: [:email]
  end

  subject { TestEmailValidatorModel.new }

  context 'when email is blank' do
    it { is_expected.not_to be_valid }
  end

  context 'when email is present' do
    context 'when format is valid' do
      before :each do
        subject.email = 'me@example.com'
      end

      it { is_expected.to be_valid }
    end

    context 'when format is invalid' do
      before :each do
        subject.email = 'notanemail.com'
      end

      it { is_expected.not_to be_valid }
    end
  end
end
