require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
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

  scenario "can navigate from home to product page details" do

    visit root_path

    expect(page).to have_css 'article.product', count: 10

    product = page.find("article:nth-child(1)").find(:link, "Details")

    product.click

    expect(page).to have_selector 'section.products-show'

    save_screenshot 'products-show.png'
  end

end
