require 'rails_helper'

describe 'instance methods' do
  it '.total_length' do
    trip_1 = Trip.create(name: 'Beginner Trip', start_date: 25, end_date: 30)

    trail_1 = trip_1.trails.create(name: 'Happy Trail', length: 3, address: '111 This Lane')
    trail_2 = trip_1.trails.create(name: 'Super Happy Trail', length: 4, address: '122 This Lane')

    expect(trip_1.total_length).to eq(7)
  end

  it '.average_length' do
    trip_1 = Trip.create(name: 'Beginner Trip', start_date: 25, end_date: 30)

    trail_1 = trip_1.trails.create(name: 'Happy Trail', length: 3, address: '111 This Lane')
    trail_2 = trip_1.trails.create(name: 'Super Happy Trail', length: 4, address: '122 This Lane')

    expect(trip_1.average_length).to eq(3.5)
  end

  it '.longest_trail' do
    trip_1 = Trip.create(name: 'Beginner Trip', start_date: 25, end_date: 30)

    trail_1 = trip_1.trails.create(name: 'Happy Trail', length: 3, address: '111 This Lane')
    trail_2 = trip_1.trails.create(name: 'Super Happy Trail', length: 4, address: '122 This Lane')

    expect(trip_1.longest_trail).to eq(trail_2)
  end

  it '.shortest_trail' do
    trip_1 = Trip.create(name: 'Beginner Trip', start_date: 25, end_date: 30)

    trail_1 = trip_1.trails.create(name: 'Happy Trail', length: 3, address: '111 This Lane')
    trail_2 = trip_1.trails.create(name: 'Super Happy Trail', length: 4, address: '122 This Lane')

    expect(trip_1.shortest_trail).to eq(trail_1)
  end
end
