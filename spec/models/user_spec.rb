require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(email: 'TEST@TEST.com', name: 'Ron', password: 'Hello_World', password_confirmation: 'Hello_World')
  end

  describe 'Validation' do 
    it 'should save valid user' do 
      @user.save
    end 

    it 'should not save invalid name' do 
      expect(User.create(name: nil).valid?).to be false 
    end 

    it 'should not save invalid email' do 
      expect(User.create(email: nil).valid?).to be false
    end
    
    it 'should have a unique email' do 
        @user.save
        @userTwo = User.new(email: 'TEST@TEST.com', name: 'Ron', password: 'Hello_World', password_confirmation: 'Hello_World')
        expect(User.create(email: @userTwo.email).valid?).to be false
    end 
    
    it 'should have a password of min 8 characaters ' do 
      @user.password = 'heyyy'
      expect(@user.valid?).to be false
    end 
  end

  describe '.authenticate_with_credentials' do
    
    it 'should have authenticated email and password' do
      @user.save
      check_user = User.authenticate_with_credentials(' test@test.COM', password: 'Hello_World')
    end

  end


end
