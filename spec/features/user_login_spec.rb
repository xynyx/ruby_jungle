require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before(:all) do
    user = User.create!(email: "blah@blah.com", first_name: "BLAH", last_name: "BLEU", password: "123456", password_confirmation: "123456")
  end


  scenario "user can login successfully and is taken to home page" do
    visit root_path

    page.find_link("Log In").click

    expect(page).to have_field("email")
    expect(page).to have_field("password")

    fill_in 'email', with: "blah@blah.com"
    fill_in "password", with: "123456"

    click_on "Submit"

    expect(page).to have_content "Logout"
    expect(page).to have_content "Signed in as BLAH"
  end


end
