require 'rails_helper'

describe 'As a User' do
  context 'When visiting a hiking trip index page' do
    it 'I see a list of all hiking trip names' do
      trip_1 = Trip.create(name: 'Beginner Trip', start_date: 25, end_date: 30)
      trip_2 = Trip.create(name: 'Medium Salsa Trip', start_date: 25, end_date: 31)

      visit trips_path

      expect(page).to have_content("#{trip_1.name}")
      expect(page).to have_content("#{trip_2.name}")
    end
  end
end
