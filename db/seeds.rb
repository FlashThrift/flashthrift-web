# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

admin = Role.new
admin.name = 'admin'
admin.save

moderators = Role.new
moderators.name = 'moderators'
moderators.save

sales = Role.new
sales.name = 'sales'
sales.save
