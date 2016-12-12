# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  user1 = User.new(
  :email => 'byron.weiss@gmail.com',
  :password => 'helloworld',
  :name => 'Fakey Fakerson'
  )
  user1.skip_confirmation!
  user1.save!
puts "user created: #{user1.inspect}"
  user2 = User.new(
  :email => 'bweiss@oak-park.us',
  :password => 'helloworld',
  :name => 'Ferris Bueller'
  )
  user2.skip_confirmation!
  user2.save!
puts "user created: #{user2.inspect}"  
users = [] 
users << user1
users << user2
game =  Game.new(
     active: true,
     users: users,
     turn: user1.id
  ) 
  game.save!
puts "game created: #{game.inspect}"   
users2 = []
users2 << user1
game2 = Game.new(
    active:true,
    users: users2,
    turn: user1.id
    )
    game2.save!
puts "game created: #{game2.inspect}"      
