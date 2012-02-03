# to do
# add/refactor per O
# polish monster names and items
# add traits: analytical, polish/charisma/social/sleekness/lacquer/oil, persuasion, will
# quotes, including hagakure, to do something great ..., even if chop off head, credibility
# add money
# give items + to abilities with announcement
# customize prompt
# time battles
# add stages to battle: discovery, motion to dismiss, summary judgment, trial
# add scope/analyze command, or run automatically: "You analyze the situation and judge you have a ...."  or "most likely"
# add settle command
# add help and/or help command
# clients there, or free clients, as in fairytale?
# mroom needed?
# currentroominventory needed?  when now have currentroom case-when?
 
 class Item
   
   attr_accessor :name, :stat
   
   def initialize (name, stat)
     @name = name
     @stat = stat
    end
      
 end
 
 
class Monster
  attr_accessor :name, :x, :y, :health, :aliveordead, :location, :inventory, :mroom
  
  def initialize (name, x, y, health, *inventory)
    @name = name
    @x = x
    @y = y
    @health = health
    @inventory = inventory
  end
  
  def location
    @location = [ @x, @y]
  end
    

  def aliveordead
    if @health > 0
       @aliveordead = "alive"
    else
       @aliveordead = "dead"
    end
 end

 
 def mroom
  case @location
    when [1,  1]; @mroom = "classroom"
    when [0,  0]; @mroom = "library"
    when [0,  1]; @mroom = "mootcourtroom"
    when [-1, 1]; @mroom = "lawtrophyroom"
    when [-1, 0]; @mroom = "basement"
    when [-1,-1]; @mroom = "auditorium"
    when [0, -1]; @mroom = "xcloset"
    when [1,  0]; @mroom = "forum"
    when [1, -1]; @mroom = "disco"
    else p "Nothing here yet, bub in line 64.  Go back to the game the way you came.  This area is still under construction by a newbie coder."
   end
 end
   
end


class Player

  attr_accessor :name, :x, :y, :inventory, :health, :location

  def initialize (name, x, y, health, *inventory)
    @name = name
    @x = x
    @y = y
    @health = health
    @inventory = inventory
  end

#

  def location
    @location = [@x, @y]
  end
end


  
players = []

players << muffy = Player.new("Mufferies", 0, 0, 5)

p "Your name is #{muffy.name} and you are carrying #{muffy.inventory}."
p "Your coordinates are #{muffy.location}."


items = []
 

items << coffeecup = Item.new("coffeecup", 3)
items << fish = Item.new("fish", 2)
items << postits = Item.new("postits", 1)
 
items << pot = Item.new("pot", 1)
items << coffeeground = Item.new("coffeeground", 1)

items << swatch = Item.new("swatch", 1)

##
items << papers = Item.new("papers", 0)
items << tile = Item.new("tile", 3)
items << spoons = Item.new("spoons", 1)

items << keys = Item.new("keys", 3)
items << airbag = Item.new("airbag", 3)
 



class Room

  attr_accessor :name, :x, :y, :inventory, :location

  def initialize (name, x, y, *rinventory)
    @name = name
    @x = x
    @y = y
    @inventory = *inventory  
  end
   
 
  def location
    @location = [@x, @y]
  end
  
 
  def rinventory
    @rinventory
  end
   
end

#initialize rooms
rooms = []

rooms << classroom = Room.new("The Classroom", 1, 1)
rooms << library = Room.new("The Library", 0, 0, spoons)
rooms << mootcourtroom = Room.new("The Moot Court Room", 0,1)
rooms << lawtrophyroom = Room.new("The Law Trophy Room", -1, 1, keys)
rooms << basement = Room.new("The Basement", -1, 0, airbag)
rooms << auditorium = Room.new("The Auditorium", -1,-1)
rooms << xcloset = Room.new("The xcloset", 0, -1)
rooms << forum = Room.new("The Forum", 1, 0)
rooms << disco = Room.new("The Disco", 1,-1)
 
 
 
#initialize monsters

monsterarray = []
 
# negligence
# fraud
# c/a product defect
# give items nicknames? in an array?  in a hash?
# can initialize monsters with items created elsewhere?
# player array that counts the number of times they have visited a room, so can create items of first impression
# or something re: the number of times they have encountered a monster?  an encounter counter?

monsterarray << allfake = Monster.new("Mr. AllFake", -1, 1, 3, tile)
monsterarray << tristesse = Monster.new("Tristesse", -1, 1, 3, swatch)

monsterarray << flybynight = Monster.new("FlyByNight", 0, 1, 3, coffeeground)
monsterarray << mrpotter = Monster.new("Mr. Potter", 0, 1, 3, coffeecup, postits, fish, pot, papers)

monsterarray << statusquo = Monster.new("statusquo", 1, 1, 3)
monsterarray << babykins = Monster.new("Babykins", 1, 1, 3)


monsterarray << growler = Monster.new("Growler", -1, -1, 3)
monsterarray << coffee = Monster.new("Coffee", 0, -1, 3)
monsterarray << judgerober = Monster.new("JudgeRober", 1, -1, 3)


  
   
#end of architecture structure.
#							  . beginning of machine architecture



   
#****************
puts "***********************************"
puts "What do you want to do?"
puts "COMMANDS: north, east, south, west, pickup [item], or drop [item]"


 
   
   
   ###########
   ###########
   ###########
while true

   ###########
   ###########
   ###########
#monsterlocation here

 


 

  rawinforeceived = gets.chomp
 
  pickupcmdreceived = /pickup/.match(rawinforeceived)
  dropcmdreceived = /drop/.match(rawinforeceived)
  attackcmdreceived = /attack/.match(rawinforeceived)
    

case muffy.location
    when [1,  1]; currentroominventory = classroom.inventory
    when [0,  0]; currentroominventory = library.inventory
    when [0,  1]; currentroominventory = mootcourtroom.inventory
    when [-1, 1]; currentroominventory = lawtrophyroom.inventory
    when [-1, 0]; currentroominventory = basement.inventory
    when [-1,-1]; currentroominventory = auditorium.inventory
    when [0, -1]; currentroominventory = xcloset.inventory
    when [1,  0]; currentroominventory = forum.inventory
    when [1, -1]; currentroominventory = disco.inventory
    else p "Nothing here yet, bub in line 239.  Go back to the game the way you came.  This area is still under construction by a newbie coder."
 end
 
 
 
case muffy.location
    when [1,  1]; currentroom = classroom
    when [0,  0]; currentroom = library
    when [0,  1]; currentroom = mootcourtroom
    when [-1, 1]; currentroom = lawtrophyroom
    when [-1, 0]; currentroom = basement
    when [-1,-1]; currentroom = auditorium
    when [0, -1]; currentroom = xcloset
    when [1,  0]; currentroom = forum
    when [1, -1]; currentroom = disco
    else p "Nothing here yet, bub in line 254.  Go back to the game the way you came.  This area is still under construction by a newbie coder."
 end

def attack(muffy, monster, rooms)
#1
  while monster.health > 0

    puts "#{muffy.name} is fighting the #{monster.name}"
    puts "#{monster.name}'s health is #{monster.health} and #{muffy.name}'s health is #{muffy.health}." 
    c = rand(10)
    if c > 8
      muffy.health -=1
      puts "The #{monster.name} grievously wounds muffy with a heavied spatula!"
    else
      monster.health -=1
      puts "oh no!  monster hurted."
    end
  
  if monster.health < 1 then monster.aliveordead = "dead" 
  else true
  end
  
  if monster.health == 0 then 
      puts "#{monster.name} is deadedDEADED!!!!!!!!."
      rooms.each do |room|
  	  	if room.location == monster.location
  	  	  
  	  	  puts "#{monster.name}'s dying act is to drop:"
          monster.inventory.each do |item|
            puts "#{item.name}"
            room.inventory.unshift(item)
            end
          puts "on the floor."
          monster.inventory = [] 
        
        else true
        end
        
        end
        
   else true
   end
  
    break if monster.health == 0
    break if muffy.health == 0
  
   #2 end for while
   end 
 #1 
end
 
 
 #if dead, just change monster name?  
  
 
# this text processing should probably go closer to bodified
if pickupcmdreceived != nil then requesteditem = rawinforeceived.sub(/pickup/,"").lstrip
end
if dropcmdreceived != nil then requesteditem = rawinforeceived.sub(/drop/,"").lstrip
end

if attackcmdreceived != nil then selectmonstertarget = rawinforeceived.sub(/attack/,"").lstrip
end

#this reacts to a modified bodified
# eventually, going to combine bodifieds etc ... into list of commands?  and methods that flip meth. arguments
 



case selectmonstertarget
  when "growler" then attack(muffy, growler, rooms)
  when "coffee" then attack(muffy, coffee, rooms)
  when "judgerober" then attack(muffy, judgerober, rooms)
  when "allfake" then attack(muffy, allfake, rooms)
  when "tristesse" then attack(muffy, tristesse, rooms)
  when "flybynight" then attack(muffy, flybynight, rooms)
  when "mrpotter" then attack(muffy, mrpotter, rooms)
  when "statusquo" then attack(muffy, statusquo, rooms)
  when "babykins" then attack(muffy, babykins, rooms)
  else 3 == 3
end
 

directions = ["north", "east", "south", "west"]
directions.each do |direction|
  if rawinforeceived == direction
    puts "You leave #{rawinforeceived}. 
     \n  ."
     
  else "something funny in this you leave command in line 470."
  end
 end
 
    case rawinforeceived
      when "north"
        muffy.y +=1
      when "east"
        muffy.x +=1
      when "south"
        muffy.y -=1
      when "west"
        muffy.x -=1
      else puts "\n"
    end


  

def drop(items, muffy, currentroominventory, requesteditem, &block)

 #check whether item is in room

if requesteditem == "all" && muffy.inventory != []
  muffy.inventory.each do |item| 
      currentroominventory.unshift(item)
      end
  muffy.inventory = []
  puts "You carelessly shake out your backpack all over the floor, leaving an unsanitary, unlawyer-like mess."
elsif requesteditem == "all" && muffy.inventory == []
  puts "Your backpack is already empty."
else true
end

muffy.inventory.each do |item|
  if item.name == requesteditem then
     muffy.inventory.delete(item)
     currentroominventory.unshift(item)
     puts "You drop the #{item.name} on the floor."
  #   roomfloor.inventory.uniq!
    else true
    end
  end

end

def pickup(items, muffy, currentroom, requesteditem, &block)
   if requesteditem == "all" && currentroom.inventory != [] then
    muffy.inventory = muffy.inventory + currentroom.inventory
    currentroom.inventory = []
    puts "You pick up everything off the floor."
  elsif requesteditem == "all" && currentroom.inventory == [] then
    puts "There is nothing to take."
  elsif requesteditem != "all" then currentroom.inventory.each do |item|
    if item.name == requesteditem then
      currentroom.inventory.delete(item)
      muffy.inventory.unshift(item)
      puts "You put the #{item.name} in your backpack."
    else true
    end
    end
  else true
  end
     
end



     



# calls pickup depending on whether pickupcmdreceived positive
if pickupcmdreceived != nil
#  puts "you typed pickup something.  i am a computer and i see this"
  pickup(items, muffy, currentroom, requesteditem)  
end



  dropcmdreceived = /drop/.match(rawinforeceived)


# call drop depending on whether dropcmdreceived positive
if dropcmdreceived != nil
#  puts "you typed drop something.  i am a computer and i see this"
  drop(items, muffy, currentroominventory, requesteditem)  {puts "you may have dropped something"}
end  

#not deleting from backpack; t/f problem with reject
#adding to floor, but with the addition of the command

  
#**************************
 def prompt(room, monsterarray, muffy)
   puts "\nYou are now in the #{room.name}                 (COORDINATES: #{room.location})"
   puts "............................................................................"
#   
 
   monsterarray.each do |monster| 
     case monster.aliveordead
       when "dead"
         unless monster.location != muffy.location
         puts "The deaded corpsed of #{monster.name} lies here."
 #           end
         end
      when "alive"
        if monster.location == muffy.location 
          if monster.inventory == [] then puts "\n#{monster.name} eyes you with a judicial-like scrutiny, sort-of."
          else puts "\n#{monster.name.upcase} is here and is holding:"
            monster.inventory.each do |item|
            puts "#{item.name}"
            end
          end
          puts "\n"
        else true
        end
      else true
      end
  #######deleted end ! here###########in case REALLY screwy!!!!
   ###end of do monster enumerator just below?
   end  

#   
   unless room.inventory == [] 
     puts "The following items are on the floor:"
     room.inventory.each do |item|
       puts "#{item.name}"
       end
   end
   puts "What would you like to do?"
   puts "COMMANDS: north, east, south, west, pickup [item], drop [item], attack [monster].\n"

###end of prompt method here
 end
 
     
 
 
#tuck this into the prompt under room/player?  or remove prompt from player/room?  redundant?
  b = muffy.location
    case b
      when [1,  1]; prompt(classroom, monsterarray, muffy)
      when [0,  0]; prompt(library, monsterarray, muffy)
      when [0,  1]; prompt(mootcourtroom, monsterarray, muffy)
      when [-1, 1]; prompt(lawtrophyroom, monsterarray, muffy)
      when [-1, 0]; prompt(basement, monsterarray, muffy)
      when [-1,-1]; prompt(auditorium, monsterarray, muffy)
      when [0, -1]; prompt(xcloset, monsterarray, muffy)
      when [1,  0]; prompt(forum, monsterarray, muffy)
      when [1, -1]; prompt(disco, monsterarray, muffy)
      else p "Nothing here yet, bub in line 616.  Go back to the game the way you came.  This area is still under construction by a newbie coder."
    end

   unless muffy.inventory == []
     puts "These items are in your backpack:"
     muffy.inventory.each do |item|
      puts "#{item.name}"  
     end
    puts "............\n\n"
   end
 
   end
   