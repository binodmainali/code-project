# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
unless Rails.env.production?
  1.upto(30) do |i|
    Event.create(
        name: "event_#{i}",
        start_date: Time.zone.now + 12.days,
        end_date: Time.zone.now + 12.days,
        location: "Bangalore",
        description: "Welcome to the biggest party of the year filled with music and dance"
    )
  end

  1.upto(10) do |i|
    User.create(
        email: "example#{i}@gmail.com",
        password: 'password'
    )
  end

  EventParticipant.create(user_id: User.last.id, event_id: Event.last.id)
  EventParticipant.create(user_id: User.first.id, event_id: Event.first.id)
end

