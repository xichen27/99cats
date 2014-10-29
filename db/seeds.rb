# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create!(
  birth_day: Date.parse('2012-2-14'),
  color: "brown",
  name: "Catty",
  sex: "M",
  description: "The best cat ever!"
)            

Cat.create!(
  birth_day: Date.parse('2001-8-14'),
  color: "black",
  name: "Ted",
  sex: "F",
  description: "just a stray"
)            

Cat.create!(
  birth_day: Date.parse('2007-2-14'),
  color: "white",
  name: "Ned",
  sex: "M",
  description: "smart cat"
)            

Cat.create!(
  birth_day: Date.parse('2011-6-5'),
  color: "black",
  name: "Ryan",
  sex: "M",
  description: "cat that speaks chinese"
)            

Cat.create!(
  birth_day: Date.parse('2011-6-5'),
  color: "black",
  name: "Shawna",
  sex: "F",
  description: "also a very smart cat, part of a twin"
)            


CatRentalRequest.create!(
  :start_date => "2000-1-1",
  :end_date => "2000-5-5",
  :cat_id => 1
)

CatRentalRequest.create!(
  :start_date => "2000-2-1",
  :end_date => "2000-6-2",
  :cat_id => 1
)

CatRentalRequest.create!(
  :start_date => "2000-2-1",
  :end_date => "2000-6-2",
  :cat_id => 1,
  :status => "APPROVED"
)