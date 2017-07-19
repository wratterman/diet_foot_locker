require 'rails_helper'

describe "User visits sneakers index page" do
  context "as an Admin" do
    it "allows Admin to see all sneakers" do
      admin = User.create(username: "penelope",
                          email: "example@hotmail.com",
                          password: "password",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_sneakers_path

      expect(page).to have_content("Admin Sneakers")
    end
  end

  context "as default user" do
    it 'does not allow default user to see admin sneakers index' do
      user = User.create(username: "moneyMax",
                         email: "fern@gully.com",
                         password: "password",
                         role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_sneakers_path

      expect(page).to_not have_content("Admin Sneakers")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
