require 'rails_helper'

RSpec.describe User, type: :model do

  it 'should be created with a password and password_confirmation' do
    @user = User.create(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'not_the_same',
      first_name: 'name',
      last_name: 'lastname'
    )
    expect(@user.password.present? && @user.password_confirmation.present?).to be true
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
    it "should not save a user with an email already in use" do
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
