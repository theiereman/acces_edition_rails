# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

5.times do |i|
  u = User.create!(
    email: "test#{i}@test.com",
    password: "password"
  )

  p "created user #{u.email} with password 'password'"

  10.times do |i|
    Event.create!(
      title: "Event #{i} from user #{u.email}",
      description: "Description #{i}",
      location: "Location #{i}",
      date: Time.now + i.days,
      user: u
    )

    p "created event #{i} for user #{u.email}"
  end
end
