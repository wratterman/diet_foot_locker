require 'rails_helper'

RSpec.feature "User creates a new account" do
  scenario "with valid attributes" do
    user_attributes = {
      username: "wratterman",
      email: "example@hotmail.com",
      password: "password"
    }

    visit 'users/new'
    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[email]",    with: user_attributes[:email]
    fill_in "user[password]", with: user_attributes[:password]
    click_on "Create Account"

    user = User.last

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("#{user.username}, successfully logged in!")
  end
end
