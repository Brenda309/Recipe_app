require 'rails_helper'

RSpec.describe 'Recipes page', type: :feature do
  describe 'with FactoryBot login' do
    before(:each) do
      @user = FactoryBot.create(:user)
      Recipe.create(name: 'Cake', description: 'Dessert', cooking_time: 3, preparation_time: 2, public: true,
                    user: @user)
      Recipe.create(name: 'Pizza', description: 'Italian circle', cooking_time: 2, preparation_time: 1, public: false,
                    user: @user)
      Recipe.create(name: 'Ice cream', description: 'Dessert', cooking_time: 4, preparation_time: 2, public: true,
                    user: @user)
    end
    it 'should lead to the recipes page' do
      sign_in @user
      visit '/public_recipes'
      expect(current_path).to eq(public_recipes_path)
    end

    it 'shuold have the header' do
      sign_in @user
      visit public_recipes_path
      expect(page).to have_content('Public recipes')
    end
  end
end
