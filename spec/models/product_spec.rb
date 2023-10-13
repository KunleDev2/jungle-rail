require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'All fields should save successfully' do
      @category = Category.new(name: 'Shoes')
      @product = Product.new(name: 'Product Name', price: 250, quantity: 8, category: @category)
      expect(@product).to be_valid
    end

    it 'If name is empty, should not save' do
      @category = Category.new(name: 'Shoes')
      @product = Product.new(price: 250, quantity: 8, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can not be empty")
    end

    it 'If price is empty, should not save' do
      @category = Category.new(name: 'Shoes')
      @product = Product.new(name: 'Product Name', quantity: 8, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price is not a number")
    end

    it 'If quantity is empty, should not save' do
      @category = Category.new(name: 'Shoes')
      @product = Product.new(name: 'Product Name', price: 250, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can not be empty")
    end

    it 'If category is empty, should not save' do
      @product = Product.new(name: 'Product Name', price: 250, quantity: 8)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can not be empty")
    end
  end
end
