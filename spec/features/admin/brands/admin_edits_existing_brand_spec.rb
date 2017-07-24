require 'rails_helper'

describe "User goes to an existing brand" do
  context "as an admin" do
    scenario "an admin can edit an existing brand" do
      brand_info = {name: "Jordan V",
      description: "The Original Jordan V's were worn by Michael Jordan",
      image_url: 'http://unlocked-wordpress.s3.amazonaws.com/uploads/2013/09/FL-Unlocked-Air-Jordan-V-Bel-Air_01.jpg',
      price: 125.99,
      footlocker_url: 'https://www.footlocker.com/product/model:159339/sku:36027602/jordan-retro-5-mens/red/black/'}
      admin = User.create(username: "wratterman",
                          email: "admin@admination.com",
                          password: "password",
                          role: 1)
      brand = Sneaker.create(brand_info)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit brand_path(brand)
      click_on "Edit"

      fill_in "brand[name]", with: "Jordan XV"
      fill_in "brand[description]", with: "The Original Jordan XV's were worn by Michael Jordan 10 years after the 5s"
      fill_in "brand[image_url]", with: brand_info[:image_url]
      fill_in "brand[price]", with: 125.99
      fill_in "brand[footlocker_url]", with: brand_info[:footlocker_url]
      click_button "Update Sneaker"

      expect(current_path).to eq("/brands/#{Brand.last.id}")
      expect(page).to have_content("Jordan XV")
      expect(Brand.count).to eq(1)
    end
  end
end
