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
      expect(page).to have_content("Longest Trail on Trip Name: #{trail_2.name} Length: #{trail_2.length}")
      expect(page).to have_content("Shortest Trail on Trip Name: #{trail_1.name} Length: #{trail_1.length}")

      click_on(trail_1.name)

      expect(current_path).to eq(trail_path(trail_1))
    end
  end
end
