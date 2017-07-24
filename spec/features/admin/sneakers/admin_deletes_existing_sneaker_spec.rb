require 'rails_helper'

describe "User goes to existing sneaker" do
  context "as an admin" do
    scenario "an admin can delete an existing sneaker" do
      image = 'http://unlocked-wordpress.s3.amazonaws.com/uploads/2013/09/FL-Unlocked-Air-Jordan-V-Bel-Air_01.jpg'
      url = 'https://www.footlocker.com/product/model:159339/sku:36027602/jordan-retro-5-mens/red/black/'
      admin = User.create(username: "wratterman",
                          email: "admin@admination.com",
                          password: "password",
                          role: 1)

      brand = Brand.create(name: "Jordan")
      sport = Sport.create(name: "Basketball")


      sneaker_info = {
      name: "Jordan V",
      description: "The Original Jordan V's were worn by Michael Jordan",
      image_url: 'http://unlocked-wordpress.s3.amazonaws.com/uploads/2013/09/FL-Unlocked-Air-Jordan-V-Bel-Air_01.jpg',
      price: 125.99,
      footlocker_url: 'https://www.footlocker.com/product/model:159339/sku:36027602/jordan-retro-5-mens/red/black/',
      brand_id: brand.id, sport_id: sport.id
      }

      sneaker = Sneaker.create(sneaker_info)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      expect(User.count).to eq(1)

      visit sneaker_path(sneaker)
      click_on "Delete"

      expect(current_path).to eq("/sneakers")
      expect(page).to have_content("Jordan V deleted")

      visit sneakers_path

      expect(page).to_not have_content("Jordan V deleted")
      expect(Sneaker.count).to eq(0)
    end
  end
end
