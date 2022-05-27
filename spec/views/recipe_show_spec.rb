require 'rails_helper'

RSpec.describe 'recipes/show', type: :feature do
  before(:each) do
    @yerimah = User.create(name: 'Yerimah', email: 'yerimah@mail.com', password: 'password')
    @yerimah_recipe = Recipe.create!(name: 'Jollof', preparation_time: '30', cooking_time: '60',
                                     description: 'Nigeria Jollof', public: true, user: @yerimah)
  end

  it 'I can see the Recipe details' do
    visit recipe_path(@yerimah_recipe.id)
    expect(page).to have_content 'Jollof'
    expect(page).to have_content '30'
    expect(page).to have_content '60'
    expect(page).to have_content 'Nigeria Jollof'
  end
end
