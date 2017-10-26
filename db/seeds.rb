# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed Users
user = {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 
    
    user['name'] = Faker::Name.name
    user['email'] = Faker::Internet.email

    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['title'] = Faker::App.name
    listing['description'] = "asdf"
    listing['property_type'] = ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Chalet", "Other"].sample

    listing['guests_capacity'] = rand(1..12)
    listing['bedroom_number'] = rand(0..6)
    listing['bathroom'] = rand(0..5)

    listing['country'] = Faker::Address.country
    listing['town_city'] = Faker::Address.city
    listing['postcode'] = Faker::Address.zip_code
    listing['address'] = Faker::Address.street_address

    listing['prices'] = rand(80..500)

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end