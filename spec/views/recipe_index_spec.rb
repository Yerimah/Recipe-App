require 'rails_helper'

RSpec.describe 'recipes/index.html.erb', type: :feature do
  describe 'integration tests for recipes page' do
    before(:each) do
      @user = User.create(name: 'Benjamin', email: 'benjamin@mail.com', password: 'password')

      @recipe = Recipe.create(
        name: 'Beef Sauce', user_id: @user.id, preparation_time: 60, cooking_time: 30,
        description: 'Put Beef and sauce together', public: true
      )

      @recipe = Recipe.create(
        name: 'Ghana Jollof', user_id: @user.id, preparation_time: 60, cooking_time: 20,
        description: 'Prepare the Jollof in Ghana', public: true
      )

      @recipe = Recipe.create(
        name: 'Nigerian Jollof', user_id: @user.id, preparation_time: 60, cooking_time: 10,
        description: 'Prepare the Jollof in Nigeria', public: true
      )

      visit user_session_path

      fill_in 'Email', with: 'benjamin@mail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      visit recipes_path
    end

    scenario 'check if recipes are available' do
      expect(page).to have_content 'Beef Sauce'
      expect(page).to have_content 'Ghana Jollof'
      expect(page).to have_content 'Nigerian Jollof'
    end
  end
end
