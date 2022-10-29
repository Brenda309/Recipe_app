require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.new(name: 'Daf', email: 'daf@gmail.com', password: '123456')
    @recipe = Recipe.new(name: 'Cake', description: 'Dessert', cooking_time: 3, preparation_time: 2, public: true,
                         user: @user)
  end
  it 'should be valid' do
    expect(@recipe).to be_valid
  end
  it 'should return the correct name' do
    expect(@recipe.name).to eq('Cake')
  end
  it 'should return the correct description' do
    expect(@recipe.description).to eq('Dessert')
  end
  it 'should return the correct cooking time' do
    expect(@recipe.cooking_time).to eq(3)
  end
  it 'should return the correct preparation time' do
    expect(@recipe.preparation_time).to eq(2)
  end
  it 'should have public as true' do
    expect(@recipe.public).to be_truthy
  end
end
