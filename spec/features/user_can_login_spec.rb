require 'rails_helper'

describe 'As a visitor' do
  it 'visit register_path I see a form' do

    visit register_path

    fill_in :name, with: "Jane"
    fill_in :email, with: "123@gmail.com"
    fill_in :password, with: "123abc"
    fill_in :password_confirmation, with: "123abc"

    click_on 'Create User'

    expect(current_path).to eq(trip_path)
    expect(page).to have_content("You have successfully registered.")
  end
end


# User Story 11
# As a visitor
# When I visit the register path
# I see a form with the following fields:
# - name
# - email
# - password
# - password confirmation
# When I submit my data,
# I am returned to the trip index path,
# and I see a flash message letting me know I have successfully registered
#
# User Story 12
# As a registered user
# When I visit the login path
# I see a field to enter my email address and password
# When I submit valid information
# I am redirected to my profile page
#
# User Story 13
# As a visitor
# At the top of every page I see the following links:
# - a link to the trip index
# - a link to register
# As a registered user I see the same links, but instead of a link to register I see a link to log in if I am logged out or log out if I am logged in
#
# User Story 14
# As a registered user
# If I am logged in
# When I click “Log out” I am returned to the trip index page.
# I see a flash message indicating I am logged out.
# I see a link to log in.

# User Story 15
#
# As a registered user
# when I visit my profile page
# I see all trips I have taken, including:
# - the total distance of the trip
# - the start date and the end date
# I also see all trails I have taken, including:
# - the number of times I have taken this trail (the number of my trips it’s included in)
# - the length of the trail
