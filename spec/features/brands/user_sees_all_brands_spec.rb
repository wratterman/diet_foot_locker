require 'rails_helper'

describe "User sees all brands" do
  scenario "a user sees all the brands" do

    brand_one = Brand.create(name: "Jordan", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')
    brand_two = Brand.create(name: "Nike", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')

    sport = Sport.create(name: "Basketball",
                         image_url: 'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')

    visit brands_path

    expect(page).to have_content("Jordan")
    expect(page).to have_link(brand_one.name, brand_path(brand_one))
    expect(page).to have_content("Nike ")
  end

end
