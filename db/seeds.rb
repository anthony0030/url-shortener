require 'faker'

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

admin_user = User.where(email: 'anthonyveaudry@gmail.com').first_or_initialize

admin_user.update!(
  first_name: 'Anthony',
  last_name: 'Veaudry',
  # admin: true,
  password: 'uNHNk-9FAQ',
  password_confirmation: 'uNHNk-9FAQ'
)

friend_user = User.where(email: 'sebastian@go-thassos.gr').first_or_initialize

friend_user.update!(
  first_name: 'Sebastian',
  last_name: 'Riddle',
  # admin: false,
  password: 'zHa!b9cesf',
  password_confirmation: 'zHa!b9cesf'
)

if Link.count < 100
  puts 'Seeding Links...'

  100.times.each do
    user = [admin_user, friend_user, nil].sample
    Link.create!(
      url: Faker::Internet.unique.url,
      user: user
    )
  end

  puts 'Seeding complete!'
end
