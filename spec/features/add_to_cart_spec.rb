require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  
  # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Add +1 to cart" do
    # ACT
    visit root_path

    # first('article.product').click_button('Add')
    # sleep 2
    product = page.first('article.product')     
    button = product.find_button('Add')      
    button.click
    sleep 2

    # DEBUG / VERIFY
    # commented out b/c it's for debugging only
    save_screenshot "add_to_cart.png"

    # VERIFY
    within ('#navbar') do
      expect(page).to have_content 'My Cart (1)'
    end
  end 
end
