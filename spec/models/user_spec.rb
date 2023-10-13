require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'password and password_confirmation should be created' do
      @user = User.new(
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_valid
    end

    it 'if password and password_confirmation do not match then it should be invalid' do
      @user = User.new(
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'wrongpassword'
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation does not match Password")
    end

    it 'password_confirmation is required' do
      @user = User.new(
        email: 'test@test.com',
        password: 'password'
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation can not be empty")
    end

    it 'email is required' do
      @user = User.new(
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can not be empty")
    end

    it 'email (not case sensitive) should be unique' do
      @user = User.new(
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user.save

      @user2 = User.new(
        email: 'TEST@TEST.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include("This email is already taken")
    end

    it 'password length of 6 characters minimum' do
      @user = User.new(
        email: 'test@test.com',
        password: 'short',
        password_confirmation: 'short'
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'if email and password match then it should authenticate' do
      user = User.create(
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )

      authenticated_user = User.authenticate_with_credentials('test@test.com', 'password')
      expect(authenticated_user).to eq(user)
    end

    it 'if email and password do not match, return nil' do
      user = User.create(
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )

      authenticated_user = User.authenticate_with_credentials('test@test.com', 'wrongpassword')
      expect(authenticated_user).to be_nil
    end

    it 'if email has leading/trailing spaces it should authenticate' do
      user = User.create(
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )

      authenticated_user = User.authenticate_with_credentials(' test@test.com ', 'password')
      expect(authenticated_user).to eq(user)
    end

    it 'should authenticate regardless of email case' do
      user = User.create(
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )

      authenticated_user = User.authenticate_with_credentials('TEST@TEST.COM', 'password')
      expect(authenticated_user).to eq(user)
    end
  end
end
