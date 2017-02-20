require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should ensure that a rpoduct with all four field set will save successfully' do
      @a_category = Category.new
      @a_category.name = 'a_cat'
      @a_product = Product.new
      @a_product.name = 'a_name'
      @a_product.price = 3
      @a_product.quantity = 1
      @a_product.category = @a_category
      @a_product.save
      expect(Product.count).to eql(1)
    end

    it 'should validate presence of name' do
      @a_category = Category.new
      @a_category.name = 'a_cat'
      @a_product = Product.new
      @a_product.name = nil
      @a_product.price = 3
      @a_product.quantity = 1
      @a_product.category = @a_category
      @a_product.valid?
      expect(@a_product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should validate presence of price' do
      @a_category = Category.new
      @a_category.name = 'a_cat'
      @a_product = Product.new
      @a_product.name = 'a_name'
      @a_product.price = nil
      @a_product.quantity = 1
      @a_product.category = @a_category
      @a_product.valid?
      expect(@a_product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should validate presence of quantity' do
      @a_category = Category.new
      @a_category.name = 'a_cat'
      @a_product = Product.new
      @a_product.name = 'a_name'
      @a_product.price = 100
      @a_product.quantity = nil
      @a_product.category = @a_category
      @a_product.valid?
      expect(@a_product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should validate presence of category' do
      @a_category = Category.new
      @a_category.name = 'a_cat'
      @a_product = Product.new
      @a_product.name = 'a_name'
      @a_product.price = 100
      @a_product.quantity = 3
      @a_product.category = nil
      @a_product.valid?
      expect(@a_product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
