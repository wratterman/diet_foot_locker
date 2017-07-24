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
      brand = Brand.create(name: "Jordan", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')
      sport = Sport.create(name: "Basketball", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit sneakers_path
      click_on "Create New Shoe"

      fill_in "sneaker[name]", with: "Jordan V"
      fill_in "sneaker[description]", with: "The Original Jordan V's were worn by Michael Jordan"
      fill_in "sneaker[image_url]", with: image
      fill_in "sneaker[price]", with: 125.99
      fill_in "sneaker[footlocker_url]", with: url
      select "Jordan", :from => "sneaker_brand_id"
      select "Basketball", :from => "sneaker_sport_id"

      click_button "Create"

      expect(current_path).to eq("/sneakers/#{Sneaker.last.id}")
      expect(page).to have_content("Jordan V")
      expect(Sneaker.count).to eq(1)
    end
  end
end
