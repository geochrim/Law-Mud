 
# room prototype for lawmudmovement
# two classes, player and room
# player location references room location and method within room class to spit out description of room for player 
# room movement confined to 3 x 3 grid with x and y coordinates limited to -1, 0 and 1 along 
# each access
# disco part still incomplete, different type for now
# player class has inventory without being used, for now

class Player

  attr_accessor :pname, :px, :py, :pinventory

  def initialize (pname, px, py, *pinventory)
    @pname = pname
    @px = px
    @py = py
    @pinventory = pinventory
  end

  def plocation
    @plocation = [@px, @py]
  end
end


muffy = Player.new("Muffy", 0, -1)
p muffy
p muffy.plocation

p "Your name is #{muffy.pname}."


class Room

  attr_accessor :rname, :rx, :ry, :rinventory

  def initialize (rname, rx, ry, *rinventory)
    @rname = rname
    @rx = rx
    @ry = ry
    @rinventory = *rinventory  
  end
   
  def rinventoryprint
    puts "**************\nYou are in the #{@rname}.  You see the following items:\n"
    @rinventory.each {|item| puts "#{item} \n"}
    puts "Which way do you want to go ('north', 'east', 'south', 'west')?"
    
  end
  
  
  
  
  
end

 #initialize rooms


classroom = Room.new("The Classroom", 1, 1, "a classroom schoolbook", "a Gymboree certificate")
library = Room.new("The Library", 0, 0, "Black's Law Dictionary", "three pieces of hardtack")
mootcourtroom = Room.new("The Moot Court Room", 0,1, "a hackey sack", "a half-swallowed pack of safety-yellow wrigley's gum")
lawtrophyroom = Room.new("The Law Trophy Room", -1, 1, "a yellowed Nassau Academy of Law certificate")
basement = Room.new("The Basement", -1, 0, "a leftover, half-empty, stale 2-litre bottle of Pepsi")
auditorium = Room.new("The Auditorium", -1,-1, "a black steel podium")
broomcloset = Room.new("The Broom closet", 0, -1, "the globe of all-knowing")
forum = Room.new("The Forum", 1, 0, "a gladiator's shield and sword")
disco = Room.new("The Disco", 1,-1, "a glittering mirror ball")
 


  p "Which way do you want to go? (type north, south, east, or west.)"
#eventually, this will become "What do you want to do?"
while 1 == 1
  a = gets.chomp
    case a
      when "north"; muffy.py +=1
      when "east"; muffy.px +=1
      when "south"; muffy.py -=1
      when "west"; muffy.px -=1
        else "You have input an invalid location and the game will now abort because you are playing
            a game coded by a newbie coder."
    end
  b = muffy.plocation
    case b
      when [1,  1]; classroom.rinventoryprint
      when [0,  0]; library.rinventoryprint
      when [0,  1]; mootcourtroom.rinventoryprint
      when [-1, 1]; lawtrophyroom.rinventoryprint
      when [-1, 0]; basement.rinventoryprint
      when [-1,-1]; auditorium.rinventoryprint
      when [0, -1]; broomcloset.rinventoryprint
      when [1,  0]; forum.rinventoryprint
      when [1, -1]; disco.rinventoryprint
      else p "Nothing here yet, bub.  Go back to the game the way you came.  This area is still under construction by a newbie coder."
    end

# for later puts "You are in the disco.  Flowering lights shower law students in a daze of hope and bewilderment."

puts "Your grid coordinates are #{muffy.plocation}."


 end

  
# see page 44 in pickaxe for example of classes talking to each other 
 