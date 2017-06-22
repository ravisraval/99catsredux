# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c1 =Cat.create(birth_date:Date.new(1776,7,4), color:"redwhiteblue", name:"Meowrica", sex:"M", description:"Hairballerz for america")
c2 =Cat.create(birth_date:Date.new(2006,7,4), color:"black", name:" Milbs ", sex:"M", description:"inside is what counts")
c3 =Cat.create(birth_date:Date.new(1990,5,14), color:"brown", name:"Rowlvi", sex:"M", description:"Maaggiiicccc(dick)")
c4 =Cat.create(birth_date:Date.new(1776,7,4), color:"white", name:" goldfish ", sex:"F", description:"crunchy and delisshh")
