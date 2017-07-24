require 'rails_helper'

describe "User goes to existing brand" do
  context "as an admin" do
    scenario "an admin can delete an existing brand" do
      image = 'http://unlocked-wordpress.s3.amazonaws.com/uploads/2013/09/FL-Unlocked-Air-Jordan-V-Bel-Air_01.jpg'
      url = 'https://www.footlocker.com/product/model:159339/sku:36027602/jordan-retro-5-mens/red/black/'
      admin = User.create(username: "wratterman",
                          email: "admin@admination.com",
                          password: "password",
                          role: 1)

      brand_info = {
      name: "Jordan V",
      description: "The Original Jordan V's were worn by Michael Jordan",
      image_url: 'http://unlocked-wordpress.s3.amazonaws.com/uploads/2013/09/FL-Unlocked-Air-Jordan-V-Bel-Air_01.jpg',
      price: 125.99,
      footlocker_url: 'https://www.footlocker.com/product/model:159339/sku:36027602/jordan-retro-5-mens/red/black/'
      }

      brand = Brand.create(brand_info)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      expect(User.count).to eq(1)

      visit brand_path(brand)
      click_on "Delete"

      expect(current_path).to eq("/brands")
      expect(page).to have_content("Jordan V deleted")

      visit brands_path

      expect(page).to_not have_content("Jordan V deleted")
      expect(Brand.count).to eq(0)
    end
  end
end
