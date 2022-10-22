require 'rails_helper'

RSpec.describe 'Recipe detail page', type: :feature do
  describe 'with FactoryBot login' do
    before(:each) do
      @user = FactoryBot.create(:user)
      @food = Food.create(name: 'Chocolate', measurement_unit: 'grams', quantity: 20, price: 1, user: @user)
      @recipe = Recipe.create(name: 'Cake', description: 'Dessert', cooking_time: 3, preparation_time: 2, public: true,
                              user: @user)
      @recipe_food = RecipeFood.create(quantity: 200, food: @food, recipe: @recipe)
    end
    context 'recipe detail page' do
      it 'should lead to the recipes page' do
        sign_in @user
        visit "/recipes/#{@recipe.id}"
        expect(current_path).to eq(recipe_path(@recipe.id))
      end

      it 'should have the header' do
        sign_in @user
        visit recipe_path(@recipe.id)
        expect(page).to have_content("Recipe ##{@recipe.id}")
      end

      it 'should show the recipe attribute names' do
        sign_in @user
        visit recipe_path(@recipe.id)
        expect(page).to have_content('Name')
        expect(page).to have_content('Description')
        expect(page).to have_content('Preparation time')
        expect(page).to have_content('Cooking time')
      end
      it 'should show the ingredient attribute names' do
        sign_in @user
        visit recipe_path(@recipe.id)
        expect(page).to have_content('Food')
        expect(page).to have_content('Quantity')
        expect(page).to have_content('Value')
        expect(page).to have_content('Actions')
      end

      it 'should link to "Add ingredient"' do
        sign_in @user
        visit recipe_path(@recipe.id)
        expect(page).to have_link('Add ingredient')
      end

      it 'should have a "Remove" button' do
        sign_in @user
        visit recipe_path(@recipe.id)
        expect(page).to have_button('Remove')
      end

      it 'should go to the ingredient form when the button is clicked' do
        sign_in @user
        visit recipe_path(@recipe.id)
        click_link 'Add ingredient'
        expect(current_path).to eq(new_recipe_recipe_food_path(@recipe.id))
      end
    end
    context 'ingredient form' do
      it 'should have the correct header' do
        sign_in @user
        visit recipe_path(@recipe.id)
        click_link 'Add ingredient'
        expect(page).to have_content('Add new ingredient')
      end

      it 'should have the "Add" button' do
        sign_in @user
        visit recipe_path(@recipe.id)
        click_link 'Add ingredient'
        expect(page).to have_button('Save recipe food')
      end

      it 'should show the input field placeholder' do
        sign_in @user
        visit recipe_path(@recipe.id)
        click_link 'Add ingredient'
        expect(page).to have_field('Quantity')
      end
    end
  end
end
