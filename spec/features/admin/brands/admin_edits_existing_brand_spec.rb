require 'rails_helper'

describe "User goes to an existing brand" do
  context "as an admin" do
    scenario "an admin can edit an existing brand" do
      admin = User.create(username: "wratterman",
                          email: "admin@admination.com",
                          password: "password",
                          role: 1)

      brand_info = {
      name: "Jordan",
      image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDTF9ai-yrE-C8U17PxxdB9EjC0sWkSjMYkD_2NwUJzqi0zkOjDKpqyWU'
      }

      sport_one   = Sport.create(name: "Soccer", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')
      sport_two   = Sport.create(name: "Basketball", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')
      sport_three = Sport.create(name: "Football", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')

      brand = Brand.create(brand_info)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit brand_path(brand)
      click_on "Edit"

      fill_in "brand[name]", with: "Jordan - New Age"
      fill_in "brand[image_url]", with: brand_info[:image_url]
      check("sport-#{sport_one.id}")
      check("sport-#{sport_three.id}")

      click_button "Update Brand"

      expect(current_path).to eq("/brands/#{Brand.last.id}")
      expect(page).to have_content("Jordan - New Age")
      expect(Brand.count).to eq(1)
    end
  end
end
