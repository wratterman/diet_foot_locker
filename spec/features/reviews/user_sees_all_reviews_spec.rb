require 'rails_helper'

describe "User sees all reviews for sneakers" do
  scenario "a user sees all the reviews for sneakers if logged in" do
    brand = Brand.create(name: "Jordan", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')
    sport = Sport.create(name: "Basketball", image_url:'https://ih1.redbubble.net/image.105177954.9599/flat,800x800,075,f.jpg')

    sneaker = Sneaker.create(name: "Jordan V",
    description: "The Original Jordan V's were worn by Michael Jordan",
    image_url: 'http://unlocked-wordpress.s3.amazonaws.com/uploads/2013/09/FL-Unlocked-Air-Jordan-V-Bel-Air_01.jpg',
    price: 125.99,
    footlocker_url: 'https://www.footlocker.com/product/model:159339/sku:36027602/jordan-retro-5-mens/red/black/',
    brand_id: brand.id, sport_id: sport.id
    )

    user_one = User.create(username: "moneyMax",
                       email: "fern@gully.com",
                       password: "password",
                       role: 0)

    user_two = User.create(username: "snoopLION",
                       email: "snoopDOGG@reefermadness.com",
                       password: "password",
                       role: 0)


    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_one)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_two)

    sneaker.reviews.create(user_id: user_one.id, body: "Chill Kicks Bruh")
    sneaker.reviews.create(user_id: user_two.id, body: "I dig it")

    visit sneaker_path(sneaker)

    expect(page).to have_content("Chill Kicks Bruh")
    expect(page).to have_content("I dig it")
  end
end
