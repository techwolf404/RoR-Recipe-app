require 'rails_helper'

RSpec.describe 'Recipe', type: :feature do
  before(:each) do
    User.destroy_all
    @user = User.create!(name: 'test', email: 'test@gmail.com', password: '123456')
    @recipe = Recipe.create!(name: 'pizza', preparation_time: '10 min', cooking_time: '3 min', description: 'famous italian food',
                             public: true, user: @user)
    @food = Food.create!(name: 'Applepie', measurement_unit: 0, price: 2, quantity: 3, user: @user)

    visit new_user_session_path
    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    sleep(1)
    visit recipes_path
  end
  describe 'tests for the recipes page' do
    it 'can see recipe name.' do
      expect(page).to have_content @recipe.name.to_s
    end

    it 'can see the header of table' do
      expect(page).to have_content 'Recipes'
    end

    it 'can see the recipes has Description' do
      expect(page).to have_content @recipe.description.to_s
    end
  end
end
