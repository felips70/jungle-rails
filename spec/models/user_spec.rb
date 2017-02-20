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

  it 'should have matching password and password_confirmation' do
    @user = User.create(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123',
      first_name: 'name',
      last_name: 'lastname'
    )
    expect(@user.password).to eql(@user.password_confirmation)
  end

  it "should be created with an email" do
    @user = User.create(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123',
      first_name: 'name',
      last_name: 'lastname'
    )
    expect(@user.email.present?).to be true
  end

  context "given that emails are the same" do
    it "should not save a user with an email already in use" do
      @user_one = User.create(
        email: 'one@example.com',
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

  it "should be created with a first_name" do
    @user = User.create(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123',
      first_name: 'name',
      last_name: 'lastname'
    )
    expect(@user.first_name.present?).to be true
  end

  it "should be created with a last_name" do
    @user = User.create(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123',
      first_name: 'name',
      last_name: 'lastname'
    )
    expect(@user.last_name.present?).to be true
  end
end
