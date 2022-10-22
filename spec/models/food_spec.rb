require 'rails_helper'

RSpec.describe Food, type: :model do
  user = User.new(name: 'Anyone', email: 'email@email.com', password: '123456')
  food = Food.new(name: 'Food name', measurement_unit: 'grams', quantity: 3, price: 7, user:)
  it 'is valid with valid attributes' do
    expect(food).to be_valid
  end
  it 'Food name must be "Food name"' do
    expect(food.name).to eq('Food name')
  end
  it 'Food measurement unit must be grams' do
    expect(food.measurement_unit).to eq('grams')
  end
  it 'Food quantity must be 3' do
    expect(food.quantity).to eq(3)
  end
  it 'Food price must be 7' do
    expect(food.price).to eq(7)
  end
end
