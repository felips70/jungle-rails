require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'if password_confirmation not present, user should not be created' do
      @user = User.create(
        email: 'test@example.com',
        password: nil,
        password_confirmation: 'password123',
        first_name: 'name',
        last_name: 'lastname'
      )
      expect(@user.save).to be false
    end

    it 'if password_confirmation not present, user should not be created' do
      @user = User.create(
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: nil,
        first_name: 'name',
        last_name: 'lastname'
      )
      expect(@user.save).to be false
    end

    it 'should not be created if password and password_confirmation do not match' do
      @user = User.create(
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'not_the_same',
        first_name: 'name',
        last_name: 'lastname'
      )
      expect(@user.save).to be false
    end

    it "should not be created if email is not present" do
      @user = User.create(
        email: nil,
        password: 'password123',
        password_confirmation: 'password123',
        first_name: 'name',
        last_name: 'lastname'
      )
      expect(@user.save).to be false
    end

    context "given that emails are the same" do
      it "the second user shoul not be created" do
        @user_one = User.create(
          email: 'ONE@example.com',
          password: 'password123',
          password_confirmation: 'password123',
          first_name: 'name',
          last_name: 'lastname'
        )
        @user_two = User.create(
          email: 'one@example.COM',
          password: 'password123',
          password_confirmation: 'password123',
          first_name: 'name',
          last_name: 'lastname'
        )
        expect(@user_two.save).to be false
      end
    end

    it "should not be created if first_name is not present" do
      @user = User.create(
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123',
        first_name: nil,
        last_name: 'lastname'
      )
      expect(@user.save).to be false
    end

    it "should not be created if last_name is not present" do
      @user = User.create(
        email: 'test@example.com',
        password: 'password123',
        password_confirmation: 'password123',
        first_name: 'name',
        last_name: nil
      )
      expect(@user.save).to be false
    end

    it "should not be created if password.length is less than 6" do
      @user = User.create(
        email: 'test@example.com',
        password: 'pass',
        password_confirmation: 'pass',
        first_name: 'name',
        last_name: 'lastname'
      )
      expect(@user.save).to be false
    end

  end

end
