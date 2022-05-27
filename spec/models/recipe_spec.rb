require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Validations for Recipe model' do
    before(:each) do
      @recipe = Recipe.create(user_id: 1, name: 'Beef Sauce', preparation_time: 30, cooking_time: 60,
                              description: 'Add beef and sauce together', public: true)
    end

    it 'check if name is present' do
      @recipe.name = nil
      expect(@recipe).to_not be_valid
    end

    it 'check if preparation time is an integer' do
      @recipe.preparation_time = 'Thirty minutes'
      expect(@recipe).to_not be_valid
    end

    it 'check if cooking time is an integer' do
      @recipe.cooking_time = 'One hour'
      expect(@recipe).to_not be_valid
    end

    it 'check if description is present' do
      @recipe.description = nil
      expect(@recipe).to_not be_valid
    end
  end
end
