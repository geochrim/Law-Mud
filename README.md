Law Mud
=======

Last November, O was gracious enough to share some of his refined wisdom with me regarding 

1. idiomatic coding syntax
2. separating a mega file into separate files
3. "meta" programming.

I have been late in posting this to github and Tugboat, per his suggestion, my apologies, but here they are, somewhat modified from gmail formatting, etc.  Thanks again, O, and this is good stuff, yo.  Check it out.

### Idiomatic Code 

So first thing I would suggest are some simple cleanup things to make the code
more Idiomatic.

First, no need to say "mlocation" or "plocation".  What you're doing there is
NameSpacing "location" with a "p" or an "m" to show it's a monster's location
or a player's location.  But the thing is is the class "Monster" or "Player" is
already doing that for you.  Just call it "location" and let the Class do it's
job of namespacing.   Otherwise you're repeating yourself when you say
"monster.mlocation" and "player.plocation".  Same with mx, px, minventory,
etc...

Second.  Organizing your files.  Normally people store their classes in one per
file.  This makes it easier to keep track of things.  Are you using textmate?
If you open the folder instead of the file "mate ." you will see a side bar
with all the files and can pop between them easily.  Anyhow doing this is a
little tricky to setup because of load paths.

The naive way to do it would be to make "item.rb" and "monster.rb" and put them
in the same folder.  Then you could 
 
```ruby
require "./monster"
require "./item"
```

at the top of the file.  The "./" means "in this folder".  The problem lies if
you run the program from a different folder, then "./" is no longer the correct
folder.  So here's the trick.  In ruby there is a special constant __FILE__
which is the file the current code is in.  So... using this you can then find
files relative to this file.  So lets say that I want to go from the folder
that this file is in and then into a sub-directory named "lib" and require a
file called "foobar.rb".

This is the file the code is in
```ruby
__FILE__
```
This is the directory that this ruby file is in
```ruby
File.dirname(__FILE__)
```
This is the sub-folder lib below the directory that holds the file that the ruby code is in
```ruby
File.dirname(__FILE__) + "/lib"
```

So... In this case I could

```ruby
require File.dirname(__FILE__) + "/lib/monster"
require File.dirname(__FILE__) + "/lib/item"
```

Of course another option would be to add that folder to the load path.  In
"irb" type $LOAD_PATH and you'll see its an array of directories that Ruby
looks for things to require.  An idiomatic way to do this would be.

```ruby
$LOAD_PATH.unshift File.dirname(__FILE__) + "/lib/"
require "monster"
require "item"
```

Also you will probably make a class that handles the basic game server.  You
often end up with a VERY short file which requires everything and starts things
and then all the code is organized into small single purpose files.  

```ruby
#!/usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(__FILE__) + "/lib/"

require "monster"
require "item"
require "lawmud"

LawMud.start
```

And that's what the entire "law_mud" executable would look like - assuming it
had all the other files organized in sub folders.  I forgot the mention the
"#!" or "Hash Bang" at the top is a unix trick to turn a program file into an
executable.  Once you do that and "chmod +x" the file you can execute it like
any other unix program without having explicitly evoke "ruby".

Anyhow - all that is just to help you organize in an idiomatic way and only
becomes important as the code base gets bigger and bigger and harder to manage.

> [ *Geoff* ] one thing I will mention, from a purely ignunt nub perspective,
> is that once you load the classes in their separate files, you have to make
> sure that you include the initializations and instances of those class objects
> in the master file, NOT the file that determines the classes; otherwise, the
> instances will be locked up locally in their class definition files instead of
> available for runtime

Next lets look at this

```ruby
monsterarray << growler = Monster.new("Growler", 0, 1, 3, "a booger", "a green fish")
```

First... clever use of << and = ... I approve. =)

Next is when looking at that "new" I see a bunch of numbers and terms and its
not obvious what I'm looking at.  Imagine what it will look like when you add
mana and vitality, and strength, and position and age and... - its going to get
harry...  here's what I recommend.  Peel out most or all of those params and
make them an "options array".  This is another idiomatic way to handle function
calls with lots of options.  Check this out

```ruby
class Monster
  attr_accessor :name, :x, :y, :health, :inventory

  def initialize(name, options = {})
    @name  = name
    @x = options[:x] || 0
    @y = options[:y] || 0
    @health = options[:health] || 100
    @inventory = options[:inventory] || []
  end
end

monsterarray << growler = Monster.new("Growler", :x => 2, :y => 1, :inventory => [ "a booger", "a green fish"])
```

So now when you read the Monster.new you know exactly what all those numbers
are... you know that 2 is the x coord and 1 is the y coord and you don't have
to check the initialize to know what is what.  You can also not bother passing
an option and have it default.  I didn't bother with health but the monster's
health will default to 100 because that's the default.  If I add a "mana"
option later I don't have to go back and add mana to monsters who don't have
any.  Much much more flexible.  If you want to make a monster at location 0,0
with 100 health and no inventory you can just do a "Monster.new("Growler")"
with no other options...

If you want to make Big Important variables that can be "seen" from inside of
lots of functions... like monsterarray I would recommend making them constants.
monsterarray is a perfect candidate. Actually so would growler...

```ruby
Monsters = []
Monsters << Growler = Monster.new("Grower", ..)
```

Now you can "see" Monsters and Growler from inside other functions.  This can
come in handy.  You want to do as few of these as possible since they clutter
the scope but a few are ok for top-down organization of things.  I'll show you
how to cut down on them in a latter email since I don't want to smoke your
brain all at once.

Next up is you could manage that giant list of monsters automatically.
Consider this...

```ruby
Monsters = []

class Monster
    attr_accessor :name, :x, :y, :health, :inventory

    def initialize(name, options = {})
      @name      = name
      @x         = options[:x] || 0
      @y         = options[:y] || 0
      @health    = options[:health] || 100
      @inventory = options[:inventory] || []
      Monsters << self
    end
end

Growler = Monster.new("Growler", :x => 2, :y => 1, :inventory => [ "a booger", "a green fish"])
```

See what I did there at the end of initialize?  Now the monsters list is
self-managing...  "self" references the current object.

Ok so -- the attack function ... if you want to loop forever - you can do a
"while true" instead of "while 2 == 2" - same thing basically but other coders
will know what you mean with while true.  But really - you don't want to loop
forever... you want to loop until one of the two are dead.  So here's an idea.
Give monster and player a function called "alive?" and returns true if health >
0 or maybe a "dead?".

```ruby
class Monster
    def alive?
      health > 0
    end

    def dead?
      not alive?
    end
end

def attach(player, monster)
   while player.alive? and monster.alive?
      ...
   end
end
```

or

```ruby
def attach(player, monster)
   until.player.dead? or monster.dead?
     ....
   end
end
```

Some things to meditate on...

```ruby
Rooms = []

Rooms << Room.new "The Classroom", ...

class Player
  def room
    Rooms.detect { |r| room.location == location }
  end
end
```

suddenly roominventory is easy... its just player.room.inventory

A ton more cool ideas but I'll stop now b/c I'm sure your brain is quite full.  Enjoy. =)

"So what is this 'meta' programming business?
---------------------------------------------

> [ *Geoff* ] it doesn't seem to be a language, in an all-or-nothing sense ("CODE META OR GO
> HOME!"); it seems to be more a collection of techniques that help compress code
> and designs, which would make maintaining it that much easier, since there's
> less of it to review.  and might enhance speed.  slightly.

> but as far as the overall desirability of learning metaprogramming, as in the
> get-a-book, get doctrinal, get religion, etc ... ... i mean, i'm game, i'm
> down, i LOVE ME THE CODING ... (what little I know), and I'm all about trying
> to get better ... but out of curiosity ... is learning meta the necessary,
> required, doctrinal "next step," or is it more a question of
> picking-and-choosing techniques which serve you as you need them ... ?"

### O responded: 

I wouldn't stress too much about it.  Learn ruby.  Some of the code will be
meta.  Some will not. Truth be told - there's not a lot of call to
meta-programming in newbie level stuff.  I'll look for opportunities in LawMud
just so you can play with it or cut your teeth on it.

Since you asked... I think the set of tools most people call "meta programming"
are the following:

### The magical 'method_missing':

```ruby
class Echo
  def method_missing(method, *args)
    puts "You called method #{method.inspect} with arguments #{args.inspect}"
  end
end

e = Echo.new
e.foo "bar", "baz"
```

Normally calling a method that does not exist on an object will get you a nasty
and much feared "NoMethodError".  Now it will print 'You called method :foo
with arguments ["bar","baz"]'

This allows you to make an object behave as if it has methods on it you never
defined.  All kinds of fun there.

### The magical '__send__':

Ok - this is kind of the opposite of method_missing.  Method_missing lets us
say "if someone calls a method give it to me as a symbol and an array of
arguments.  __send__ says... "if I have a symbol named matching a method name
and some arguments I want to call that method.  Or basically

```ruby
player.shout "hello", :volume => :loud
```

and

```ruby
player.__send__ :shout, "hello", :volume => :loud 
```

are exactly the same.

Ok - so big effing deal.  How do we put these together...  Ok lets say I have a
big complex program and something really strange is happening to my player
object.  I suspect someone is calling the wrong methods or maybe calling them
too many times but I'm not sure.  I really want it print out all the methods
being call and with what arguments so I can watch whats happening and see.  So
I make a BigBrother class that watches his every move.

```ruby
class BigBrother
  def initialize(victim)
    @victim = victim
  end

  def method_missing(method, *args)
    puts "#{method.inspect} called with #{args.inspect}"
    @victim.__send__ method, *args
  end
end
```

Now big brother has no methods except for initialize which gives it a victim to
watch and a method_missing which puts out whats being called and then send's
the exact same method and args on to the victim.  So if I call "foobar" on
BigBrother it will in turn called "foobar" on @victim.  So now somewhere in my
code I have a 

```ruby
Mufferies = Player.new("Mufferies")
```

Now I just replace it with 

```ruby
Mufferies = BigBrother.new(Player.new("Mufferies"))
```

And everything will behave as before but now I will get a message whenever a
method is called of Mufferies.

### The magical 'respond_to?'

This lets you check an object and determine if it has a method declared by some name.

```ruby
def kill(target)
  if target.respond_to? :die
    puts "#{target.name} dies a horrible death."
    target.die
  else
    puts "You cannot kill that which cannot die!"
end
```

This would make sense where if you tried to kill a coffeepot or a ghost or a
bad idea you would get a funny message - but if it was a Monster or Player it
would kill them.

### Monkey Patching:

This is the practice of opening up an existing class and adding methods to it.
This is generally not a good idea but hey - Ruby lets you do it.  The term was
borrowed from Python which also allows you to do this.  It was normally used
for fixing bugs in existing libraries without having to wait for the maintainer
to fix it for you.  Pythoners called it Guerrilla Patching since it was a
covert/irregular way to fix the bug.  Rubiests being dorks decided they would
call it Monkey Patching.  

My favorite example is what Rails (activesupport) does to the Fixnum class.
Fixnum is the class that basic numbers like 5 or 200 have.  It's something like
this.

```ruby
class Fixnum
  def seconds
    self
  end

  def minutes
    self * 60
  end

  def hours
    self * 60 * 60
  end

  def days
    self * 60 * 60 * 24
  end

  def ago
    Time.now - self
  end

  def from_now
    Time.now + self
  end
end
```

This allows you to write code that looks like this

```ruby
duration = 5.hours
start = 2.days.ago
end = 50.minutes.from_now
```

So evil.  Yet so beautiful.

There are others but I'll stop here.  instance_eval, class_eval.  All kinds.  Have fun =)

Note: I'm doing all of this with Ruby 1.9.2.  Some of these things are slighly different in 1.8.7.

