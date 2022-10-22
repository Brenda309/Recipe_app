require 'rails_helper'

RSpec.describe 'Recipes page', type: :feature do
  describe 'with FactoryBot login' do
    before(:each) do
      @user = FactoryBot.create(:user)
      Recipe.create(name: 'bugger', description: 'main meal', cooking_time: 1, preparation_time: 2, public: true,
                    user: @user)
      Recipe.create(name: 'Pizza', description: 'Italian circle', cooking_time: 2, preparation_time: 1, public: false,
                    user: @user)
      Recipe.create(name: 'milk shake', description: 'Drink', cooking_time: 4, preparation_time: 2, public: true,
                    user: @user)
    end
    context 'main recipes page' do
      it 'should lead to the recipes page' do
        sign_in @user
        visit '/recipes'
        expect(current_path).to eq(recipes_path)
      end

      it 'should have the header' do
        sign_in @user
        visit recipes_path
        expect(page).to have_content('Recipes')
      end

      it 'should link to "Add recipe"' do
        sign_in @user
        visit recipes_path
        expect(page).to have_link('Add recipe')
      end

      it 'should have a "Remove" button' do
        sign_in @user
        visit recipes_path
        expect(page).to have_button('REMOVE')
      end

      it 'should go to the recipe form when the button is clicked' do
        sign_in @user
        visit recipes_path
        click_link 'Add recipe'
        expect(current_path).to eq(new_recipe_path)
      end
    end
    context 'recipe form' do
      it 'should have the correct header' do
        sign_in @user
        visit recipes_path
        click_link 'Add recipe'
        expect(page).to have_content('Add new recipe')
      end
      it 'should show the input field placeholders' do
        sign_in @user
        visit recipes_path
        click_link 'Add recipe'
        expect(page).to have_field('name')
        expect(page).to have_field('description')
        expect(page).to have_field('preparation time')
        expect(page).to have_field('cooking time')
      end
      it 'should have a "Public?" checkbox' do
        sign_in @user
        visit recipes_path
        expect(page).to have_content('Public?')
      end
    end
  end
end
