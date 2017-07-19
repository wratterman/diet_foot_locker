require 'rails_helper'

describe "User goes to new sneaker" do
  context "as an admin" do
    scenario "an admin can create a new sneaker" do
      image = 'http://unlocked-wordpress.s3.amazonaws.com/uploads/2013/09/FL-Unlocked-Air-Jordan-V-Bel-Air_01.jpg'
      url = 'https://www.footlocker.com/product/model:159339/sku:36027602/jordan-retro-5-mens/red/black/'
      admin = User.create(username: "wratterman",
                          email: "admin@admination.com",
                          password: "password",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_sneaker_path

      fill_in "sneaker[name]", with: "Jordan V"
      fill_in "sneaker[description]", with: "The Original Jordan V's were worn by Michael Jordan"
      fill_in "sneaker[image_url]", with: image
      fill_in "sneaker[price]", with: 125.99
      fill_in "sneaker[footlocker_url]", with: url
      click_button "Create"

      expect(current_path).to eq("/sneaker/#{Sneaker.last.id}")
      expect(page).to have_content("Jordan V")
      expect(Sneaker.count).to eq(1)
    end
  end
end
