require 'rails_helper'

describe "User goes to an existing sneaker" do
  context "as an admin" do
    scenario "an admin can edit an existing sneaker" do
      sneaker_info = {name: "Jordan V",
      description: "The Original Jordan V's were worn by Michael Jordan",
      image_url: 'http://unlocked-wordpress.s3.amazonaws.com/uploads/2013/09/FL-Unlocked-Air-Jordan-V-Bel-Air_01.jpg',
      price: 125.99,
      footlocker_url: 'https://www.footlocker.com/product/model:159339/sku:36027602/jordan-retro-5-mens/red/black/'}
      admin = User.create(username: "wratterman",
                          email: "admin@admination.com",
                          password: "password",
                          role: 1)
      sneaker = Sneaker.create(sneaker_info)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_admin_sneaker_path(sneaker)

      fill_in "sneaker[name]", with: "Jordan XV"
      fill_in "sneaker[description]", with: "The Original Jordan XV's were worn by Michael Jordan 10 years after the 5s"
      fill_in "sneaker[image_url]", with: sneaker_info[:image_url]
      fill_in "sneaker[price]", with: 125.99
      fill_in "sneaker[footlocker_url]", with: sneaker_info[:footlocker_url]
      click_button "Update Sneaker"

      expect(current_path).to eq("/sneakers/#{Sneaker.last.id}")
      expect(page).to have_content("Jordan XV")
      expect(Sneaker.count).to eq(1)
    end
  end
end
