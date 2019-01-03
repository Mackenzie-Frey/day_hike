require 'rails_helper'

describe 'As a user on the trail show page' do
  it 'I see all info' do
    trip_1 = Trip.create(name: 'Beginner Trip', start_date: 25, end_date: 30)
    trip_2 = Trip.create(name: 'Medium Salsa Trip', start_date: 25, end_date: 31)

    trail_1 = trip_1.trails.create(name: 'Happy Trail', length: 3, address: '111 This Lane')


    visit trail_path(trail_1)

    expect(page).to have_content(trail_1.name)
    expect(page).to have_content(trip_1.name)
    expect(page).to have_content(trip_1.total_length)
    expect(page).to have_content("Total Trips: #{trail_1.total_trips}")
  end
end



# User Story 10 of 10
#
# As a visitor,
# when I visit a trail's page,
# I see the total number of hiking trips where this trail
# was included
