require 'rails_helper'

describe "User sees one sneaker" do
  scenario "a user sees a sneaker" do
    brand = Brand.create(name: "Jordan", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')
    sport = Sport.create(name: "Basketball", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')

    sneaker_info = {name: "Jordan V",
    description: "The Original Jordan V's were worn by Michael Jordan",
    image_url: 'http://unlocked-wordpress.s3.amazonaws.com/uploads/2013/09/FL-Unlocked-Air-Jordan-V-Bel-Air_01.jpg',
    price: 125.99,
    footlocker_url: 'https://www.footlocker.com/product/model:159339/sku:36027602/jordan-retro-5-mens/red/black/',
    brand_id: brand.id, sport_id: sport.id
    }

    sneaker = Sneaker.create(sneaker_info)

    visit sneaker_path(sneaker)

    expect(current_path).to eq("/sneakers/#{sneaker.id}")
    expect(page).to have_content("Jordan V")
    expect(page).to have_link("Buy Now", sneaker_info[:footlocker_url])
  end
end
