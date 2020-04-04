# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
unless Rails.env.production?
  # Create 10 multi day events
  1.upto(10) do
    Event.create(
        name: Faker::Sports::Football.competition,
        start_date: Time.zone.now + rand(100).days,
        end_date: Time.zone.now + 12.days,
        location: ("#{Faker::Address.state},#{Faker::Address.street_name}"),
        description: Faker::Lorem.paragraph
    )
  end

  # create 10 single day events
  1.upto(10) do
    Event.create(
      name: Faker::Sports::Football.competition,
      start_date: Time.zone.now + rand(50).days,
      location: ("#{Faker::Address.state},#{Faker::Address.street_name}"),
      description: Faker::Lorem.paragraph
    )
  end
  # Create 10 past events
  1.upto(10) do
    Event.create(
        name: Faker::Sports::Football.competition,
        start_date: Time.zone.now - rand(50).days,
        location: ("#{Faker::Address.state},#{Faker::Address.street_name}"),
        description: Faker::Lorem.paragraph
    )
  end

  # Create 5 male users
  1.upto(5) do
    User.create(
        email: Faker::Internet.email,
        password: 'password',
        name: Faker::Name.masculine_name,
        gender: 'Male'
    )
  end

  # Create 5 female users
  1.upto(5) do
    User.create(
        email: Faker::Internet.email,
        password: 'password',
        name: Faker::Name.feminine_name,
        gender: 'Female'
    )
  end

  # create event with price
  15.times do
    EventPricing.create(price: 1000.00, event_id: rand(30))
  end

  EventParticipant.create(user_id: User.last.id, event_id: Event.last.id)
  EventParticipant.create(user_id: User.first.id, event_id: Event.first.id)
end

