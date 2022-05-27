require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Validations for the Food model' do
    before(:each) do
      @food = Food.create(user_id: 1, name: 'chicken', unit: 'kg', price: 10)
    end

    it 'check if name is present' do
      @food.name = nil
      expect(@food).to_not be_valid
    end

    it 'check if unit is present' do
      @food.unit = nil
      expect(@food).to_not be_valid
    end

    it 'check if price is an integer' do
      @food.price = 'Ten'
      expect(@food).to_not be_valid
    end

    it 'check if price is greater or equal to zero' do
      @food.price = -2
      expect(@food).to_not be_valid
    end
  end
end
