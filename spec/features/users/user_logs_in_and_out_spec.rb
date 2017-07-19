require "rails_helper"

RSpec.feature "User logs in and out" do
  scenario "with valid credentials" do
    user_attributes = {
      username: "wratterman",
      email: "example@hotmail.com",
      password: "password"
    }

    user = User.create(user_attributes)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Email", with: user.email
    fill_in "session[password]", with: user_attributes[:password]

    click_on "Login"

    expect(current_path).to eq(sneakers_path)
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("#{user.username}, successfully logged in!")

    click_on "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("#{user.username}")
    expect(page).to have_content("Goodbye")
  end
end
