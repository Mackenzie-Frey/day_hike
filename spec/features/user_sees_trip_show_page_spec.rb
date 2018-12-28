require 'rails_helper'

describe 'As a User' do
  context 'When visiting a hiking trip show page' do
    it 'I see all info' do
      trip_1 = Trip.create(name: 'Beginner Trip', start_date: 25, end_date: 30)
      trip_2 = Trip.create(name: 'Medium Salsa Trip', start_date: 25, end_date: 31)

      trail_1 = trip_1.trails.create(name: 'Happy Trail', length: 3, address: '111 This Lane')
      trail_2 = trip_1.trails.create(name: 'Super Happy Trail', length: 4, address: '122 This Lane')
      trail_3 = trip_2.trails.create(name: 'The Happiest Trail', length: 5, address: '123 This Lane')

      visit trip_path(trip_1)

      expect(page).to have_content(trail_1.name)
      expect(page).to have_content(trail_2.name)

      expect(page).to have_content(trail_1.address)
      expect(page).to_not have_content(trail_3.address)

      expect(page).to have_content("Length: #{trail_1.length}")
      expect(page).to_not have_content("Length: #{trail_3.length}")

      expect(page).to have_content("Total Distance: #{trip_1.total_length}")
      expect(page).to have_content("Average Distance: #{trip_1.average_length}")
    end
  end
end

# User Story 5 of 10
#
# As a visitor,
# when I visit a hiking trip's page,
# I see the average hiking distance
# of all trails on that hiking trip
# User Story 6 of 10
#
# As a visitor,
# when I visit a hiking trip's page,
# I see a heading that says "Longest Trail on Trip"
#   and the name and length of the longest trail
#   included on that hiking trip
# User Story 7 of 10
#
# As a visitor,
# when I visit a hiking trip's page,
# I see a heading that says "Shortest Trail on Trip"
#   and the name and length of the longest trail
#   included on that hiking trip
# User Story 8 of 10
#
# As a visitor,
# when I visit a hiking trip's page,
# I can click on the name of a trail
# to see a show page for that specific trail.
