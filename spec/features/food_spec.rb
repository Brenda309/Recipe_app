require 'rails_helper'

RSpec.describe 'Foods page', type: :feature do
  describe 'with FactoryBot login' do
    before(:each) do
      @user = FactoryBot.create(:user)
      Food.create(name: 'Apple', measurement_unit: 'grams', quantity: 1, price: 5, user: @user)
      Food.create(name: 'Pineapple', measurement_unit: 'grams', quantity: 1, price: 1, user: @user)
      Food.create(name: 'Chicken breasts', measurement_unit: 'units', quantity: 1, price: 2, user: @user)
    end

    it 'will present foods page' do
      sign_in @user
      visit '/foods'
      expect(current_path).to eq(foods_path)
    end

    it 'will have table header content' do
      sign_in @user
      visit foods_path
      expect(page).to have_content('Food')
      expect(page).to have_content('Measurement unit')
      expect(page).to have_content('Quantity')
      expect(page).to have_content('Unit price')
    end

    it 'will have table content' do
      sign_in @user
      visit foods_path
      expect(page).to have_content('Apple')
      expect(page).to have_content('Pineapple')
      expect(page).to have_content('Chicken breasts')
      expect(page).to have_content('grams')
      expect(page).to have_content('units')
      expect(page).to have_content('1')
      expect(page).to have_content('2')
      expect(page).to_not have_content('3')
      expect(page).to_not have_content('4')
      expect(page).to have_content('5')
    end

    it 'will have link to "Add food"' do
      sign_in @user
      visit foods_path
      expect(page).to have_link('Add food')
    end

    it 'will have button "Delete"' do
      sign_in @user
      visit foods_path
      expect(page).to have_button('Delete')
    end

    it 'will have classes for bootstrap buttons' do
      sign_in @user
      visit foods_path
      expect(page).to have_css('.btn-danger')
      expect(page).to have_css('.btn-sm')
    end

    it 'will go to new food page when click on "Add food" button' do
      sign_in @user
      visit foods_path
      click_link 'Add food'
      expect(current_path).to eq(new_food_path)
    end

    it 'will have new food page content' do
      sign_in @user
      visit foods_path
      click_link 'Add food'
      expect(page).to have_content('New food')
    end

    it 'will have new food page with button "Add"' do
      sign_in @user
      visit foods_path
      click_link 'Add food'
      expect(page).to have_button('Add')
    end

    it 'will have new food page with input fields' do
      sign_in @user
      visit foods_path
      click_link 'Add food'
      expect(page).to have_field('name')
      expect(page).to have_field('measurement unit')
      expect(page).to have_field('quantity')
      expect(page).to have_field('price')
    end

    it 'will have new food page with classes for bootstrap forms' do
      sign_in @user
      visit foods_path
      click_link 'Add food'
      expect(page).to have_css('.form-control')
      expect(page).to have_css('.form-group')
    end
  end
end
