# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  user1 = User.new(
  :email => 'byron.weiss@gmail.com',
  :password => 'helloworld'
  )
  user1.save!

  user2 = User.new(
  :email => 'bweiss@oak-park.us',
  :password => 'helloworld'
  )
  user2.save!
  
game =  Game.new(

     active: true
   ) 
   game.save!
   
Seat.create!(
    game: game,
    user: user1
    )

Seat.create!(
    game: game,
    user: user2
    )
    
game2 = Game.new(
    active:true
    )
    game2.save!
    
Seat.create!(
    game: game2,
    user: user1
    )