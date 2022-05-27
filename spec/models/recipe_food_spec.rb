require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user = User.create(name: 'Teresa', email: 'teresa@mail.com', password: 'password')
    @recipe = Recipe.create(name: 'Fruit Salad', preparation_time: '15', cooking_time: '15', description: 'Mix multiple fruits', public: true, user: @user)
    @food = Food.create(name: 'chocolate', unit: 'kg', price: 3, user: @user)
    @recipe_food = RecipeFood.create(quantity: 2, recipe: @recipe, food: @food)
  end

  after(:each) do
    Recipe.destroy_all
    Food.destroy_all
    RecipeFood.destroy_all
    User.destroy_all
  end

  it 'Create a Recipe Food' do
    expect(@recipe_food).to be_valid
    expect(@recipe_food.quantity).to eq 2
    expect(@recipe_food.recipe).to eq @recipe
    expect(@recipe_food.food).to eq @food
  end
end
