require 'rails_helper'

describe "User goes to new sport" do
  context "as an admin" do
    scenario "an admin can create a new sport" do
      image = 'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg'

      brand_one   = Brand.create(name: "Jordan",
                                 image_url: 'https://i.ytimg.com/vi/IvsFTn3PK10/maxresdefault.jpg')
      brand_two   = Brand.create(name: "Nike",
                                 image_url: 'http://logok.org/wp-content/uploads/2014/03/Nike-logo-+-wordmark.png')
      brand_three = Brand.create(name: "Adidas",
                                 image_url: 'http://www.thelogofactory.com/wp-content/uploads/2015/09/adidas-trefoil-logo.png')


      admin = User.create(username: "wratterman",
                          email: "admin@admination.com",
                          password: "password",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit sports_path

      click_on "Create New Sport"

      fill_in "sport[name]", with: "Basketball"
      fill_in "sport[image_url]", with: image

      check("brand-#{brand_one.id}")
      check("brand-#{brand_three.id}")

      click_button "Create Sport"

      expect(current_path).to eq("/sports/#{Sport.last.id}")
      expect(page).to have_content("Basketball")
      expect(Sport.count).to eq(1)
    end
  end
end
