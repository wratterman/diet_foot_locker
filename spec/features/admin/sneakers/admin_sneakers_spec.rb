require 'rails_helper'

describe "User visits sneakers index page" do
  context "as an Admin" do
    it "allows Admin to see all sneakers" do
      admin = User.create(username: "penelope",
                          email: "example@hotmail.com",
                          password: "password",
                          role: 1)

      brand = Brand.create(name: "Jordan", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')
      sport = Sport.create(name: "Basketball", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')

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

      visit sneakers_path

      expect(page).to have_content("List of Sneakers")
      expect(page).to have_link("Jordan V", sneaker_path(sneaker))
      expect(page).to have_content("Edit")
      expect(page).to have_content("Delete")
    end
  end

  context "as default user" do
    it 'does not allow default user to see admin sneakers index' do
      user = User.create(username: "moneyMax",
                         email: "fern@gully.com",
                         password: "password",
                         role: 0)

      brand = Brand.create(name: "Jordan", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')
      sport = Sport.create(name: "Basketball", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')

      sneaker_info = {
      name: "Jordan V",
      description: "The Original Jordan V's were worn by Michael Jordan",
      image_url: 'http://unlocked-wordpress.s3.amazonaws.com/uploads/2013/09/FL-Unlocked-Air-Jordan-V-Bel-Air_01.jpg',
      price: 125.99,
      footlocker_url: 'https://www.footlocker.com/product/model:159339/sku:36027602/jordan-retro-5-mens/red/black/',
      brand_id: brand.id, sport_id: sport.id
      }

      sneaker = Sneaker.create(sneaker_info)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit sneakers_path

      expect(page).to have_link(sneaker.name)
      expect(page).to_not have_content("Edit")
      expect(page).to_not have_content("Delete")
    end
  end
end
