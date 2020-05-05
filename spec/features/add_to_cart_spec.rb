require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99,
        image: open_asset('apparel1.jpg')
      )
    end
  end

  scenario "add product to cart" do


    visit root_path

    cart = page.find_by_id("cart").find("a")

    expect(cart).to have_content "My Cart (0)"

    expect(page).to have_css 'article.product', count: 10

    product = page.find("article:nth-child(1)")

    product.click_button("Add")

    expect(cart).to have_content "My Cart (1)"

    save_screenshot

  end
  
end
