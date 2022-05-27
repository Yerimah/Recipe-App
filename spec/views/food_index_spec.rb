require 'rails_helper'

RSpec.describe 'food/index.html.erb', type: :feature do
  describe 'integration tests for foods page' do
    before(:each) do
      @user = User.create(name: 'Daniel', email: 'daniel@mail.com', password: 'password')
      @food = Food.create(name: 'Chicken', user_id: @user.id, unit: 'kilogram', price: 30)
      @food = Food.create(name: 'Avocado', user_id: @user.id, unit: 'kilogram', price: 20)
      @food = Food.create(name: 'Melon', user_id: @user.id, unit: 'kilogram', price: 10)

      visit new_user_session_path

      fill_in 'Email', with: 'daniel@mail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      visit foods_path
    end

    scenario 'check if foods are available' do
      expect(page).to have_content 'Chicken'
      expect(page).to have_content 'Avocado'
      expect(page).to have_content 'Melon'
    end
  end
end
