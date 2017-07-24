require 'rails_helper'

describe "User visits sports index page" do
  context "as an Admin" do
    it "allows Admin to see all sports" do
      admin = User.create(username: "penelope",
                          email: "example@hotmail.com",
                          password: "password",
                          role: 1)

      sport = Sport.create(name: "Basketball",
                           image_url: "https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit sports_path

      expect(page).to have_content("List of Sports")
      expect(page).to have_link(sport.name, sport_path(sport))
      expect(page).to have_content("Edit")
      expect(page).to have_content("Delete")
    end
  end

  context "as default user" do
    it 'does not allow default user to see admin sports index' do
      user = User.create(username: "moneyMax",
                         email: "fern@gully.com",
                         password: "password",
                         role: 0)

      sport = Sport.create(name: "Basketball",
                           image_url: "https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit sports_path

      expect(page).to have_link(sport.name, sport_path(sport))
      expect(page).to_not have_content("Edit")
      expect(page).to_not have_content("Delete")
    end
  end
end
