require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @category = Category.new(name: 'Education')
    @product = Product.new(name: 'Math Textbook', price: 1000000, quantity: 8, category: @category)
  end

  describe 'Validation' do 
    it 'should save valid product' do 
      @product.save
    end 

    it 'should not save invalid product name' do 
      expect(Product.create(name: nil).valid?).to be false 
    end 

    it 'should not save invalid product price' do 
      expect(Product.create(price_cents: nil).valid?).to be false
    end 

    it 'shoud not save invalid quantity' do 
      expect(Product.create(quantity: nil).valid?).to be false
    end 

    it 'should not save invalid category' do 
      expect(Product.create(category: nil).valid?).to be false
    end 
    

  end 
end
