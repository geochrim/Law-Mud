 
 class Item
   
   attr_accessor :iname, :ix, :iy
   
   def initialize (iname, ix, iy)
     @iname = iname
     @ix = ix
     @iy = iy
   end
   
   def ilocation
     @ilocation = [ @ix, @iy]
   end
   
 end
 
 
class Monster
  attr_accessor :mname, :mx, :my, :minventory, :mhealth
  
  def initialize (mname, mx, my, mhealth, *minventory)
    @mname = mname
    @mx = mx
    @my = my
    @mhealth = mhealth
    @minventory = minventory
  end
  
  def mlocation
    @mlocation = [ @mx, @my]
  end
   
  def mhealth
    @mhealth
  end
   
end


class Player

  attr_accessor :pname, :px, :py, :pinventory, :phealth

  def initialize (pname, px, py, phealth, *pinventory)
    @pname = pname
    @px = px
    @py = py
    @phealth = phealth
    @pinventory = pinventory
  end

 def pinventory
   @pinventory
 end

#
  def premove(target)
    @pinventory = @pinventory.reject{|target| target}
    puts "You have have removed the #{target} from the player."
    #are we going to have a problem with this line and string interpolation?
  end
  
  def punshiftitem(target)
    @pinventory = @pinventory.unshift(target)
    puts "You have added the #{target} to the player."
    #are we going to have a problem with this line and string interpolation?
  end
#

  def plocation
    @plocation = [@px, @py]
  end
end



players = []

players << muffy = Player.new("Mufferies", 0, 0, 5, "a fish", "a taco")

p "Your name is #{muffy.pname} and you are carrying #{muffy.pinventory}."
p "Your coordinates are #{muffy.plocation}."

class Room

  attr_accessor :rname, :rx, :ry, :rinventory

  def initialize (rname, rx, ry, *rinventory)
    @rname = rname
    @rx = rx
    @ry = ry
    @rinventory = *rinventory  
  end
   
  def rinventoryprint
    puts "**************\nYou are in the #{@rname}.  You see the following items on the floor:\n"
    @rinventory.each {|item| puts "#{item.to_s} \n"}
    puts "***********************************"
    puts "What do you want to do?"
    puts "COMMANDS: north, east, south, west, pickup [item], or drop [item]"
     
  end
  
  #
  def rremove(target)
    @rinventory = @rinventory.reject{|target| target}
    puts "You have removed the #{target} from the room."
    #are we going to have a problem with this line and string interpolation?
  end
  
  def runshiftitem(target)
    @rinventory = @rinventory.unshift(target)
    puts "You have added the #{target} to this room.   "
    #are we going to have a problem with this line and string interpolation?
    
  end
#

 
  def rinventory
    @rinventory
  end
   
end

#initialize rooms

classroom = Room.new("The Classroom", 1, 1, "a schoolbook")
library = Room.new("The Library", 0, 0, "a dictionary", "hardtack")
mootcourtroom = Room.new("The Moot Court Room", 0,1, "gum")
lawtrophyroom = Room.new("The Law Trophy Room", -1, 1, "a certificate")
basement = Room.new("The Basement", -1, 0, "a Pepsi")
auditorium = Room.new("The Auditorium", -1,-1, "a podium")
xcloset = Room.new("The xcloset", 0, -1, "a globe")
forum = Room.new("The Forum", 1, 0, "a shield")
disco = Room.new("The Disco", 1,-1, "a ball")
 
#initialize monsters

monsterarray = []
 

monsterarray << growler = Monster.new("Growler", 0, 1, 3, "a booger", "a green fish")
monsterarray << coffee = Monster.new("Coffee", 1, 1, 3, "an enchilada", "a houseguest")
monsterarray << judgerober = Monster.new("JudgeRober", 0, -1, 3, "a scattegories puzzle", "a clue")
 



#initialize items

items = []
 

items << coffeecup = Item.new("Coffeecup", 0, 1)
items << coffeecupfish = Item.new("Coffeecupfish", 0, 1)
items << coffeecupsh = Item.new("Coffeecupsh", 0, 1)
 


#end of architecture structure.
#							  . beginning of machine architecture


#eventually, this will become "What do you want to do?"

   
#****************
puts "***********************************"
puts "What do you want to do?"
puts "COMMANDS: north, east, south, west, pickup [item], or drop [item]"
   
while 1 == 1
      
monsterarray.each do |monster| 
  case 
    when monster.mhealth == 0 then 3 == 3
    else 
      if monster.mlocation == muffy.plocation
        puts "#{monster.mname.upcase} is in the same room as #{muffy.pname}."
        puts "type 'attack' [monster] to attack the monster!"
      else 
      3 == 3
      end
  end
end

 

rawinforeceived = gets.chomp

# the following is an assignment ... but it tests for a match?  yes.  assigns to pickupcmdreceived the portion that
# matches
  
  pickupcmdreceived = /pickup/.match(rawinforeceived)
  dropcmdreceived = /drop/.match(rawinforeceived)
  attackcmdreceived = /attack/.match(rawinforeceived)
 
case muffy.plocation
  when [1,  1]; roomfloor = classroom.rinventory
  when [0,  0]; roomfloor = library.rinventory
  when [0,  1]; roomfloor = mootcourtroom.rinventory
  when [-1, 1]; roomfloor = lawtrophyroom.rinventory
  when [-1, 0]; roomfloor = basement.rinventory
  when [-1,-1]; roomfloor = auditorium.rinventory
  when [0, -1]; roomfloor = xcloset.rinventory
  when [1,  0]; roomfloor = forum.rinventory
  when [1, -1]; roomfloor = disco.rinventory
  else p "Nothing here yet, bub.  Go back to the game the way you came.  This area is still under construction by a newbie coder."
end
 


def attack(muffy, monster, roomfloor)
  while 2 == 2
  break if muffy.phealth == 0
  if monster.mhealth == 0 then deadmonster(monster,roomfloor) 
  end
  break if monster.mhealth == 0
  puts "#{muffy.pname} is fighting the #{monster.mname}"

  puts "#{monster.mname}'s health is #{monster.mhealth} and #{muffy.pname}'s health is #{muffy.phealth}."
  c = rand(10)
  if c > 8
    muffy.phealth -=1
    puts "The #{monster.mname} grievously wounds muffy with a heavied spatula!"
  else
    monster.mhealth -=1
    puts "oh no!  monster hurted."
  end
  
  end
end
 
 def deadmonster(monster, roomfloor)
   roomfloor.unshift("The deaded corpse of #{monster.mname}.")
   
 end
 
 

def testtwoconditions(condition1, conditon2)
  if condition1 == true and condition2 == true
    then runmethod()
  else
    puts "this testtwoconditions thing didn't work."
  end
end



if pickupcmdreceived != nil then bodified = rawinforeceived.sub(/pickup/,"").lstrip
end
if dropcmdreceived != nil then bodified = rawinforeceived.sub(/drop/,"").lstrip
end

if attackcmdreceived != nil then bodifiedmonster = rawinforeceived.sub(/attack/,"").lstrip
end




case bodifiedmonster
  when "growler" then attack(muffy, growler, roomfloor)
  when "coffee" then attack(muffy, coffee, roomfloor)
  when "judgerober" then attack(muffy, judgerober, roomfloor)
  else puts "nothing here in this bodifiedmonster case/when"
end
 
 
  

    case rawinforeceived
      when "north"; muffy.py +=1
      when "east"; muffy.px +=1
      when "south"; muffy.py -=1
      when "west"; muffy.px -=1
      else puts "\n"
    end


 
 


def pickup(roomfloor, player, bodified, &block)
  if roomfloor.detect{|item| item == bodified }
    then roomfloor.reject!{|item| item == bodified}
         player.pinventory.unshift(bodified)
         yield
    else 
    puts "THERE IS NO #{bodified.upcase} ON THE FLOOR!  THERE IS NO #{bodified.upcase} ON THE FLOOR!"
  end
end

def drop(roominventory, player, bodified, &block)
  if player.pinventory.detect{|item| item == bodified }
    then player.pinventory.reject!{|item| item == bodified}
         roominventory.unshift(bodified)
         yield
    else
    puts "THERE IS NO #{bodified.upcase} IN YOUR BACKPACK!  I sAId THERE IS NO #{bodified.upcase} IN YOUR BACKPACK!"
  end
end



if pickupcmdreceived != nil
#  puts "you typed pickup something.  i am a computer and i see this"
  pickup(roomfloor, muffy, bodified) {puts "you might have picked something up"}
end


if dropcmdreceived != nil
#  puts "you typed drop something.  i am a computer and i see this"
  drop(roomfloor, muffy, bodified) {puts "you may have dropped something"}
end  

#not deleting from backpack; t/f problem with reject
#adding to floor, but with the addition of the command

p "END: Your backpack contains: #{muffy.pinventory}."
p "End: The floor contains: #{roomfloor}."

#**************************
 
 
 

  b = muffy.plocation
    case b
      when [1,  1]; classroom.rinventoryprint
      when [0,  0]; library.rinventoryprint
      when [0,  1]; mootcourtroom.rinventoryprint
      when [-1, 1]; lawtrophyroom.rinventoryprint
      when [-1, 0]; basement.rinventoryprint
      when [-1,-1]; auditorium.rinventoryprint
      when [0, -1]; xcloset.rinventoryprint
      when [1,  0]; forum.rinventoryprint
      when [1, -1]; puts "You are in the disco.  Flowering lights shower law students in a daze of hope and bewilderment."
      else p "Nothing here yet, bub.  Go back to the game the way you came.  This area is still under construction by a newbie coder."
    end

 
puts "Your grid coordinates are #{muffy.plocation}."
 puts "These items are in your backpack: #{muffy.pinventory}."
 
 
 end
 