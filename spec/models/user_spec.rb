require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations for the User model' do
    before(:each) do
      @user = User.create(name: 'Maria', email: 'maria@mail.com', password: 'password')
    end

    after(:each) do
      User.destroy_all
    end

    it 'check if name is present' do
      expect(@user).to be_valid
    end

    it 'check if name is present' do
      @user.name = nil
      expect(@user).to_not be_valid
    end
  end
end
