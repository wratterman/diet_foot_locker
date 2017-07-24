require 'rails_helper'

describe "User visits brands index page" do
  context "as an Admin" do
    it "allows Admin to see all brands" do
      admin = User.create(username: "penelope",
                          email: "example@hotmail.com",
                          password: "password",
                          role: 1)

      brand = Brand.create(name: "Jordan", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDTF9ai-yrE-C8U17PxxdB9EjC0sWkSjMYkD_2NwUJzqi0zkOjDKpqyWU")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit brands_path

      expect(page).to have_content("List of Brands")
      expect(page).to have_link(brand.name, brand_path(brand))
      expect(page).to have_content("Edit")
      expect(page).to have_content("Delete")
    end
  end

  context "as default user" do
    it 'does not allow default user to see admin brands index' do
      user = User.create(username: "moneyMax",
                         email: "fern@gully.com",
                         password: "password",
                         role: 0)

      brand = Brand.create(name: "Jordan",
                           image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDTF9ai-yrE-C8U17PxxdB9EjC0sWkSjMYkD_2NwUJzqi0zkOjDKpqyWU")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit brands_path

      expect(page).to have_link(brand.name, brand_path(brand))
      expect(page).to_not have_content("Edit")
      expect(page).to_not have_content("Delete")
    end
  end
end
