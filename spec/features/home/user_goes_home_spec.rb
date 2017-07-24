require 'rails_helper'

describe "User goes to home page" do
  scenario "a user sees a home page" do
    brand = Brand.create(name: "Jordan", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')
    sport = Sport.create(name: "Basketball", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')

    sneaker_info_one = {name: "Jordan V",
    description: "The Original Jordan V's were worn by Michael Jordan",
    image_url: 'http://unlocked-wordpress.s3.amazonaws.com/uploads/2013/09/FL-Unlocked-Air-Jordan-V-Bel-Air_01.jpg',
    price: 125.99,
    footlocker_url: 'https://www.footlocker.com/product/model:159339/sku:36027602/jordan-retro-5-mens/red/black/',
    brand_id: brand.id, sport_id: sport.id
    }

    sneaker_info_two = {name: "Jordan VI",
    description: "The Original Jordan VI's were worn by Michael Jordan",
    image_url: 'http://unlocked-wordpress.s3.amazonaws.com/uploads/2013/09/FL-Unlocked-Air-Jordan-V-Bel-Air_01.jpg',
    price: 126.99,
    footlocker_url: 'https://www.footlocker.com/product/model:159339/sku:36027602/jordan-retro-5-mens/red/black/',
    brand_id: brand.id, sport_id: sport.id
    }

    sneaker_one = Sneaker.create(sneaker_info_one)
    sneaker_two = Sneaker.create(sneaker_info_two)

    visit root_path

    expect(current_path).to eq("/")
    expect(page).to have_content("New Releases")
    expect(page).to have_content("Jordan V")
    expect(page).to have_content("Jordan VI")
    expect(page).to have_link("Additional Info", sneaker_path(sneaker_one))
  end
end
