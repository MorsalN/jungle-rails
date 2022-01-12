require 'rails_helper'
require 'capybara/poltergeist'

RSpec.feature "ProductDetails", type: :feature, js: true do


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

  scenario "They see all products" do
    # ACT
    visit root_path

    first('article.product').click_link('Details')

    # DEBUG / VERIFY
    # commented out b/c it's for debugging only
    save_screenshot

    # VERIFY
    expect(page).to have_css '.product-detail'
  end


end
