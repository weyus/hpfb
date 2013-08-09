# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Destruction
User.destroy_all
Provider.destroy_all

#Healthpost admin user
User.create(email: 'admin@healthpost.com', password: 'password', admin: true)

#Providers
memorial_hermann = Provider.create(name: 'Memorial Hermann')
memorial_hermann.users.create(email: 'healthpost_admin@memorialhermann.com', password: 'password', provider_admin: true)
memorial_hermann.users.create(email: 'healthpost_user@memorialhermann.com', password: 'password')

hca_gulf_coast = Provider.create(name: 'HCA Gulf Coast')
hca_gulf_coast.users.create(email: 'healthpost_admin@hca_gulf_coast.com', password: 'password', provider_admin: true)
hca_gulf_coast.users.create(email: 'healthpost_user@hca_gulf_coast.com', password: 'password')

methodist = Provider.create(name: 'Methodist')
methodist.users.create(email: 'healthpost_admin@methodist.com', password: 'password', provider_admin: true)
methodist.users.create(email: 'healthpost_user@methodist.com', password: 'password')