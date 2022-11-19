require 'rails_helper'

RSpec.describe 'Foods', type: :feature do
  describe 'Food#index' do
    before(:each) do
      User.destroy_all
      @user = User.create!(name: 'test', email: 'test@gmail.com', password: '123456')
      Food.create!(name: 'Guava', measurement_unit: 'gram', quantity: 2, price: 1, user_id: @user.id)

      visit new_user_session_path
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      sleep(1)
      visit foods_path
    end

    it 'should display all the food details' do
      expect(page).to have_content 'Guava'
      expect(page).to have_content '1'
    end
  end
end
