 
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

def attack(muffy, monster)
  while 2 == 2
  break if muffy.phealth == 0
  break if monster.mhealth == 0
  puts "#{muffy.pname} is fighting the #{monster.mname}"

  puts "#{monster.mname}'s health is #{monster.mhealth} and #{muffy.pname}'s health is #{muffy.phealth}."
  c = rand(10)
  if c > 8
    muffy.phealth -=1
    puts "hi!"
  else
    monster.mhealth -=1
    puts "oh no!  monster hurted."
  end
  
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
    @rinventory.each {|item| puts "#{item} \n"}
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
 

monsterarray << growler = Monster.new("The Growler", 0, 1, 3, "a booger", "a green fish")
monsterarray << coffeehungry = Monster.new("Coffee Hungry", 1, 1, 3, "an enchilada", "a houseguest")
monsterarray << loser = Monster.new("JudgeRober", 0, -1, 3, "a scattegories puzzle", "a clue")
 

#end of architecture structure.
#							  . beginning of machine architecture


#eventually, this will become "What do you want to do?"

   
#****************
puts "***********************************"
puts "What do you want to do?"
puts "COMMANDS: north, east, south, west, pickup [item], or drop [item]"
   
while 1 == 1
      
monsterarray.each do |monster| 
  if monster.mlocation == muffy.plocation
  puts "#{monster.mname.upcase} is in the same room as #{muffy.pname}."
  attack(muffy, monster)
  else
  3 == 3
  end
  
  end

 
 

rawinforeceived = gets.chomp

# the following is an assignment ... but it tests for a match?  yes.  assigns to pickupcmdreceived the portion that
# matches
  
  pickupcmdreceived = /pickup/.match(rawinforeceived)
  dropcmdreceived = /drop/.match(rawinforeceived)
 
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

# an array with all monsters in it
# cycle through array and place them in the room inventories

# puts monsterarray

#going to get an error for rlocation?
#need to tie monstery location into room location in monster class?  as something that references
#monster location with roomlocation?
#put the addmonster to rinventory in monsterclass?  but problem with this is that need it to be in the loop?  unless
# invoke it from the loop?

# monsterarray.each do |monster.mlocation, roomfloor|
# addmonstertorinventory(

###! at beginning of loop,
###! check where monster's are and compare against player's location (this can be a method b/c we use it more than once)
###! if there is a match, print, "there is a monster here!" and set condition1 to true
###! (then store the monster in a special array that has monsters the player is (fighting)
###! 
###! #change monster's location and if a monster moves set condition2 to true
###! check monster status against player's location 
###! if matches AND monster moves, then puts "monster has left"
###! how do a thing where we test two condition?  through a "testtwoconditions" method?

#monsters in array
#monster location
#cycle through monster locations
#[monsters]each do |location| if location == plocation then puts "there is a monster here!"

 

def runmethod()
end

def testtwoconditions(condition1, conditon2)
  if condition1 == true and condition2 == true
    then runmethod()
  else
    puts "this testtwoconditions thing didn't work."
  end
end

  
 ###!1. monsters
###! 2. monster coordinates
###!   - put monsters in room inventories?
###! 3. monster x.y coordinates.  a master grid.  room has a variable/hash/array
###!    that keeps track of what is in it.  the inventory.  
###!    if a monster enters a room, it is added to the room's inventory
###!    then the room's inventory method spits it out to the player
###! 4. then, a subsection that is always testing whether there is a monster
###!    showing up in the room's inventory.  testing the items' class
###!    and if it is a monster, then it attacks and subtracts a life 
###!    whenever you enter the room
###!    thereafter, can start combat system,
###!    and get monsters moving around randomly
###!    and player attacking back

###!    for starters, need a method that tracks and stores monster's coordinates
###!    or 
###!    checks monster's coordinates
###!    1. each monster has a method that keeps track/publishes its coordinates
###!    and
###!    2. there is a master grid/case/when that says if your monster coordinates are
###!       such, then you are in room x
###!    3. and then, runs a method/case when that adds/removes monster to/from room inventories
###!    and THEN, there is a 







case muffy.plocation
  when [0,1]; puts "there will be a monster here."
  else p "this monster location part still in progress."
end


if pickupcmdreceived != nil then bodified = rawinforeceived.sub(/pickup/,"").lstrip
end
if dropcmdreceived != nil then bodified = rawinforeceived.sub(/drop/,"").lstrip
end
 



# how add condition to regular expression?

 

# p "rawinforeceived   = #{rawinforeceived}"
# p "bodified          = #{bodified}"
# p "pickupcmdreceived = #{pickupcmdreceived}"
# p "dropcmdreceived   = #{dropcmdreceived}"


    case rawinforeceived
      when "north"; muffy.py +=1
      when "east"; muffy.px +=1
      when "south"; muffy.py -=1
      when "west"; muffy.px -=1
      else puts "\n"
    end


 
  
 #define method

###! to solve problem of accidentally creating duplicate items
###! create items as classes
###! or
###! uniq, p. 447-448 uniq!
###! keep_if, 439
###! or select! 445
###! include 705
###! detect 478
###! select, 485, or reject, 485

 


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

 
# maybe add this section down after the linkage between roomfloor, etc ... 

# array 1 is the array we are adding to
# array 2 is the array we are removing from
# we do these lines regardless b/c we want to make sure stuff is added/deleted
 




# maybe take the thing to be removed and treat it as a method?
# what is getting called on what?
# parts:
# the thing bodified
# the player array
# the room array
# if get then take bodified and do this to that arry and that to this array
# if drop then take bodified then do this to taht array and that to this array
# use the chute of blocks to send bodified into it

# there is a method for adding things to an array
# only the array differs
# there is a method for removing things from an array
# only the array differs
# and 
# bodified is bodified

# def get (bodified)

# end
# {|bodified|
#  pinventory.unshift (bodified)
#  rinventory.delete 


# case 
# when getcmdreceived == "get" then get (bodified)
# when dropcmdreceived == "drop" then drop (bodified)
#need to include (target) in this?  #getcmdreceived returns only the get; dropcmdreceived returns
# only the drop; each is only a validation that the word exists but has the target stripped out
# bodified is the item, therefore, shoudl accept it as the target?  as the method argument?
# end

#####
#####
# for 10.12, do we need a roomguide? for current room?  how reconcile above and ########aaaaaaaaaa below?  which more 
# important?  the above code, b/c ###aaaaaa will bounce it between the commands, but this code will only 
# act when there is actually a command received?
# we want getcmdreceived adn dropcmd received to know if we're going to have a command.
# maybe change movement to go (target)?
		# target practice (for October??)
# roomfloor not updating
#####
#####


#this = current best place for methods?
# def get (target)
#   muffy.punshiftitem (target)
#   room.rremove (target)
# end

# def drop (target)
#   muffy.premove(target)
#   room.runshiftitem(target) 
# end
 
  

# commandreceived = bodified

# case commandreceived
#    when "get" then get (target)
#    when "drop" then drop (target)
# else puts "\n"
# end


#vunderthumper
#wunderthumper
#spoozlefork
#sparzlefork

 

 #?s
  # how pass values from method to block and back?

# the .rinventory is how the room introduces itself to the player
# so should there be a method within the player for items?
# or within the rooms?
# within rooms, for the inventory, etc ...

 

 # need to think about items and wielding eventually, for now, just bounce things around between arrays ... you have it or you don't

#there is going to be a part that tests for a match between pinventory/roomfloor and bodified
#there is going to be a part that analyzes whether the match was in pinventory or roomfloor
#assigns a value to ticker variable, 1 for pinventory 0 for roomfloor
#if 1 then add/remove from one, remove from the other
#and assign a to one and b to another, or vice versa
#and then delete, remove, or vice versa, or accordingly

# can all this go into one block?
#different methods?
# small methods that test for ... ?

#and there is going to be a part the removes an item if there is a match
#and there is going to be a part that adds an item if there is a match
#maybe rename variables roomfloor and muffy.pinventory into a and b depending on which is matched
#if there is a match in roomfloor, roomfloor = a, ternary operator? 135 331
#boolean expression ? expr1 : expr2
#roomfloor.include? bodified ? a = roomfloor : b = roomfloor
#item_test {}

#item_test {}
#when you start thinking about what the method will be, what the yield block will be, what arguments to call
# how organize?  think of the method as the primary outline?
#and the block that gets passed to the method call is the thing/pargraph that's going to get called a couple times
#and the arguments are the pre-existing? things that are going to get tossed around
#so when you write the method, think about what elements/arguments you are going to need to draw in
#what needs to get done twice?  that part will be the block
#what is the method?  
#we have the roomfloor, which is the room-specific inventory
#we are going to take that and compare it against the get request, or vice versa
#we have the backpack inventory, which is the player-specific inventory
#and we are going to take that and compare it against the get request
#the get request goes in the code block
#therefore the method definition 

# reference

#delete v. reject?
#delete returns nil if item not found
#reject returns nil if arr unchanged
#nesting not a problem b/c methods are public

#example
#def who_says_what
#  yield("Dave", "hello")
#  yield("Andy", "goodbye")
#end
#
#who_says_what {|person, phrase| puts "#{person} says #{phrase}"}
#

 
# case/when
#can either put on same line with then
# or drop down to new line
# can't use semicolon in 1.9

# p. 101 regexp 
# MatchData object returned from the .match method,
# encapsulates all the information Ruby knows about the match
# pre_match returns the part of the string before the match
# post-match returns the string after the match
# what do we use to return only the part that matches?
# find?  replace all else?
# p. 109 lookahead and lookbehind
# match pattern only if the matched substring is preceded by or followed by some other pattern (here, any other text)
# after a match, magic variables $& received the part of the string that was matched
# $' receies the part of the string that preceded the match
# $' receives the string after the match


#the feeling
#the saying, b/c you don't want to let drift too far away
#the feeling builds
#you want to say more
#you want to do more
#you have to ask yourself why you want to say more
#and the only answer is the one that will rip your life apart

 


 


# if roomfloor.to_s.include? bodified 
#   yield
#   else puts "\n"
#end
#   {roomfloor.each do |item|
#     if item == bodified
#        roomfloor.delete(item)
#        muffy.pinventory.unshift(item)
#  		puts "You pick up the #{bodified} from the room's floor and put it in the backpack."
#  		else
#  		puts "\n"
#  	 end}

#bodified or the method vbodified?

#must make roomfloor a method?
 

     
 
 		
#  backpack.each do |item|
#    if item == bodified
#      p "You take the #{item} out of your backpack and lazily drop it on the foodfloor."
#      backpack.delete(item)
#      foodfloor.unshift(item)
#    else puts "\n"
#    end

# if muffy.pinventory.to_s.include? bodified 
# 	yield
# 	else puts "\n"
# end
#   {muffy.pinventory.reject!{|item| item == bodified}
#  		  roomfloor.unshift(bodified)
#  		  puts "You take the #{bodified} out of your backpack and gingerly place it on the floor."}
     
  
##########aaaaaaaaaaaaaaa
#####this code will bounce it back and forth between the arrays indefinitely
# will the above code, too?
# case
# when pinventory.include? bodified
#  	backpack.delete(item)
# 	foodfloor.unshift(item)
# 	p "You take the #{bodified} out of your backpack and lazily drop it on the foodfloor."

# when roomfloor.include? bodified
#	backpack.delete(item)
#	foodfloor.unshift(item)
#	p "You pick the #{bodified} off the floor and put it into your backpack."
# else puts "something funny is around here!"
# end
   
# if muffy.pinventory.to_s.include? bodified 
# 	muffy.pinventory.reject!{|item| item == bodified}
#  		  roomfloor.unshift(bodified)
#  		  puts "You take the #{bodified} out of your backpack and gingerly place it on the floor."
# 	else puts "\n"
# end
########


 