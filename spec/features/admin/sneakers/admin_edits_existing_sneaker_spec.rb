require 'rails_helper'

describe "User goes to an existing sneaker" do
  context "as an admin" do
    scenario "an admin can edit an existing sneaker" do
      admin = User.create(username: "wratterman",
      email: "admin@admination.com",
      password: "password",
      role: 1)

      brand = Brand.create(name: "Jordan", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')
      sport = Sport.create(name: "Basketball", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')

      sneaker_info = {name: "Jordan V",
      description: "The Original Jordan V's were worn by Michael Jordan",
      image_url: 'http://unlocked-wordpress.s3.amazonaws.com/uploads/2013/09/FL-Unlocked-Air-Jordan-V-Bel-Air_01.jpg',
      price: 125.99,
      footlocker_url: 'https://www.footlocker.com/product/model:159339/sku:36027602/jordan-retro-5-mens/red/black/',
      brand_id: brand.id, sport_id: sport.id
      }
      sneaker = Sneaker.create(sneaker_info)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit sneaker_path(sneaker)
      click_on "Edit"

      fill_in "sneaker[name]", with: "Jordan XV"
      fill_in "sneaker[description]", with: "The Original Jordan XV's were worn by Michael Jordan 10 years after the 5s"
      fill_in "sneaker[image_url]", with: sneaker_info[:image_url]
      fill_in "sneaker[price]", with: 125.99
      fill_in "sneaker[footlocker_url]", with: sneaker_info[:footlocker_url]
      select "Jordan", :from => "sneaker_brand_id"
      select "Basketball", :from => "sneaker_sport_id"

      click_button "Update Sneaker"

      expect(current_path).to eq("/sneakers/#{Sneaker.last.id}")
      expect(page).to have_content("Jordan XV")
      expect(page).to_not have_content("Jordan V")
      expect(Sneaker.count).to eq(1)
    end
  end
end
