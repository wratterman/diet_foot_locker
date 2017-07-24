require 'rails_helper'

describe "User goes to existing brand" do
  context "as an admin" do
    scenario "an admin can delete an existing brand" do
      admin = User.create(username: "wratterman",
                          email: "admin@admination.com",
                          password: "password",
                          role: 1)

      brand_info = {
      name: "Jordan",
      image_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDTF9ai-yrE-C8U17PxxdB9EjC0sWkSjMYkD_2NwUJzqi0zkOjDKpqyWU'
      }

      brand = Brand.create(brand_info)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      expect(User.count).to eq(1)

      visit brand_path(brand)
      click_on "Delete"

      expect(current_path).to eq("/brands")
      expect(page).to have_content("Jordan")

      visit brands_path

      expect(page).to_not have_content("Jordan")
      expect(Brand.count).to eq(0)
    end
  end
end
