require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Validations for Recipe model' do
    before(:each) do
      @user = User.create(name: 'Joseph', email: 'joseph@mail.com', password: 'password')
      @recipe = Recipe.create(user: @user, name: 'Beef Sauce', preparation_time: 30, cooking_time: 60,
                              description: 'Add beef and sauce together', public: true)
    end

    it 'check if name is present' do
      @recipe.name = nil
      expect(@recipe).to_not be_valid
    end

    it 'check if preparation time is an integer' do
      @recipe.preparation_time = 'Thirty minutes'
      expect(@recipe).to be_valid
    end

    it 'check if cooking time is an integer' do
      @recipe.cooking_time = 'One hour'
      expect(@recipe).to be_valid
    end

    it 'check if description is present' do
      @recipe.description = nil
      expect(@recipe).to_not be_valid
    end

    it 'should create a recipe' do
      expect(@recipe).to be_valid
      expect(@recipe.name).to eq 'Beef Sauce'
      expect(@recipe.preparation_time).to eq '30'
      expect(@recipe.cooking_time).to eq '60'
      expect(@recipe.description).to eq 'Add beef and sauce together'
      expect(@recipe.user).to eq @user
    end

    it 'checks public/private feature' do
      expect(@recipe.public).to eq true
    end
  end
end
