require 'rails_helper'

describe "User sees all sports" do
  scenario "a user sees all the sports" do

    brand = Brand.create(name: "Jordan", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')

    sport_one = Sport.create(name: "Basketball",
                             image_url: 'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')

    sport_two = Sport.create(name: "Casual Wear",
                             image_url: 'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')

    visit sports_path

    expect(page).to have_content("Basketball")
    expect(page).to have_content("Casual Wear")
  end

end
