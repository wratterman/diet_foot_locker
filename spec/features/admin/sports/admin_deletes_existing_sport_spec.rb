require 'rails_helper'

describe "User goes to existing sport" do
  context "as an admin" do
    scenario "an admin can delete an existing sport" do
      admin = User.create(username: "wratterman",
                          email: "admin@admination.com",
                          password: "password",
                          role: 1)

      sport_info = {
      name: "Basketball",
      image_url: 'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg'
      }

      sport = Sport.create(sport_info)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      expect(User.count).to eq(1)

      visit sport_path(sport)
      click_on "Delete"

      expect(current_path).to eq("/sports")
      expect(page).to have_content("Basketball")

      visit sports_path

      expect(page).to_not have_content("Basketball")
      expect(Sport.count).to eq(0)
    end
  end
end
