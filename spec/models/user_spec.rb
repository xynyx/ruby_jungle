require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject {
    described_class.new(email: "TEST@TEST.COM", first_name: "TEST", last_name: "McTESTERSON", password: "1234", password_confirmation: "1234")
  }
  
  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is invalid when password confirmation does not match' do
      subject.password_confirmation = "1"
      expect(subject).to be_invalid
    end

    it 'is invalid when password not given in both fields' do
      subject.password_confirmation = nil
      expect(subject).to be_invalid
    end

    it "is invalid when email already exists in the database (case insensitive)" do
      subject.save!
      @user = User.new(email: "test@test.COM", first_name: "TEST", last_name: "McTESTERSON", password: "1234", password_confirmation: "1234")
      expect(@user).to be_invalid
    end

    it "is invalid when email not given" do
      subject.email = nil
      expect(subject).to be_invalid
    end

    it "is invalid when first_name not given" do
      subject.first_name = nil
      expect(subject).to be_invalid
    end

    it "is invalid when last_name not given" do
      subject.last_name = nil
      expect(subject).to be_invalid
    end

  end
end
