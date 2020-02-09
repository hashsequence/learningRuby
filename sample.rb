##########Ch1 Ruby Summary######


##comment : v1
#celcius = 100
#farenheit = (celcius * 9 / 5) + 32
#puts "The result is "
#puts farenheit
#puts "."

##comment : v2
#print "Hello. Please enter a Celsius value"
#celsius = gets
#farenheit = (celsius.to_i * 9 / 5) + 3
#print "The Farenheit equivalent is "
#print farenheit
#puts "."

##comment : v3 getting inoput
#print "Hello. Please enter a Celsius value "
#print "The Farenheit equiivalent is ", gets.to_i * 9/ 5 + 32, ".\n"

#
#x = 100.to_s #converts to string
#puts x
#s = "gw".to_i #converts to integer
#puts s
#

=begin
load and require used to include outside files


load "/home/users/dblack/book/code/loadee.rb"


require "./loadee.rb"

you ususually use require

require searches for the library in all the defined search paths
 and also appends .rb or .so to the file name you enter. It also
 makes sure that a library is only included once. So if your application
 requires library A and B and library B requries library A too A would be
  loaded only once.

With load you need to add the full name of the library and it
 gets loaded every time you call load - even if it already is in memory.

 Switch Description Example of usage
 -c Check the syntax of a program file without executing the program ruby -c c2f.rb
 -w Give warning messages during program execution ruby -w c2f.rb
 -e Execute the code provided in quotation marks on the command line ruby -e 'puts "Code demo!"'
 -l Line mode: print a newline after every line of output ruby -le 'print "+ newline!"'
 -rname Require the named feature ruby –rprofile
 -v Show Ruby version information and execute the program in verbose mode ruby –v
 --version Show Ruby version information ruby –-version
 -h Show information about all command-line switches for the interpreter ruby –h

 ri (Ruby Index) and RDoc (Ruby Documentation), originally written by Dave Thomas, are a closely
related pair of tools for providing documentation about Ruby programs. ri is a command-line tool;
the RDoc system includes the command-line tool rdoc. ri and rdoc are standalone programs; you run
them from the command line.

rake is a make-inspired task-management utility.
It was written by the late Jim Weirich. Like make, rake reads and executes tasks defined in a file—a
Rakefile. Unlike make, however, rake uses Ruby syntax to define its tasks.
=end

######ch2 Objects, methods, and local variabes

=begin

topics:
Objects and object orientation
Innate versus learned object capabilities
Method parameter, argument, and calling syntax
Local variable assignment and usage
Object references

2.1 talking to objects
ruby is heavily object oriented

ruby is all about creating objects and giving them properties

obj = Object.new #creates a generic objects

#defining a method talk for object obj

def obj.talk
  puts "I am an object"
  puts " (Do you Object?)"
end

methods that tak arguments

def obj.c2f(c)
  c * 9.0/ 5 + 32
end

# calling the method
puts obj.c2f(100)

#parenthesis optional when calling
def obj.c2f caches_action :

def obj.c2f(c)
return c * 9.0 / 5 + 32
end

2.2 crafting an object: the behavior of a ticket


ticket = Obj.new

def ticket.date
  "01/02/03"
end

def ticket.venue
  "Town Hall"
end

 #etc ... a bunch of more print methods for tickets

 #how to query the tiket object

 print ticket.event + " whatever "


 string interpolation
 #{...}

 puts "this ticket is for : #{ticket.event}, whatever"

 expressing boolean state in a methods

 def ticket.available?
  false
end

false and true are objects in ruby

You may have noticed that the method name
available? ends with a question mark. Ruby lets you do this so you can write methods that evaluate
to true or false and make the method calls look like questions:

if ticket.available?
puts "You're in luck!"
else
puts "Sorry--that seat has been sold."
end

Every expression in Ruby
evaluates to an object, and every object in Ruby has a truth value.
The truth value of almost every
object in Ruby is true. The only objects whose truth value
(or Boolean value) is false are the
object false and the special nonentity object nil


puts("youll see this")
puts "youll see this"

if puts("youll see this")
  puts "will not be called"
end

will return nil which is false so
the output is:
youll see this

everything in Ruby has a
Boolean value, and sometimes it’s not what you might expect.

2.3 the innate behavoiors of an object

 Every object is “born” with certain innate abilities.

p Objects.new.methods.sort

this will output The result is a list of all the messages
 (methods) this newly minted object comes bundled with.

 common innate object methods

 object_id
 respond_to?
 send (synonymn __send__)

 generic objects vs basic objects

 Asking Ruby to create a new object for you with the Object.new command produces what we’re
 calling here, informally, a generic object. Ruby also has basic objects—and that’s a more formal
 name. If you call BasicObject.new, you get a kind of proto-object that can do very little. You can’t
 even ask a basic object to show you its methods, because it has no methods method! In fact, it has
 only seven methods—enough for the object to exist and be identifiable, and not much more.

 Every object in Ruby has a unique ID number associated with it. You can see an object’s ID by asking
 the object to show you its object_id:

 obj = Object.new
puts "The id of obj is #{obj.object_id}."

obj.respond_to?

checks whether the obj method has been defined:

obj = Object.new
if obj.respond_to?("talk")
obj.talk
else
puts "Sorry, the object doesn't understand the 'talk' message."
end

this checks if talk has been defined for obj

sending images to objects with send method:

print "Information desired: "
request = gets.chomp

The second line of code gets a line of keyboard input,
“chomps” off the trailing newline character,
and saves the resulting string in the variable request.


using __send__ or public_send

public_send cannot call an objects private method

required and optional arguments:

When you call a Ruby method, you have to supply the correct number of arguments

unless you have * in front of argument:

def obj.multi_args(*x)
puts "I can take zero or more arguments!"
end

in this case x is an array of values

default values for arguments:

Default arguments are indicated with an equal sign and a value.
 Here’s an example:
def default_args(a,b,c=1)
puts "Values of variables: ",a,b,c
end

order of paramenters and arguments:

What output would you expect from the following code snippet?
def mixed_args(a,b,*c,d)
puts "Arguments:"
p a,b,c,d
end
mixed_args(1,2,3,4,5)

output:

Arguments:
1
2
[3, 4]
5

the *c sponges and leaves the tail end for params after *c


in this complex case look in the book:

def args_unleashed(a,b=1,*c,d,e)
puts "Arguments:"
p a,b,c,d,e
end

what you cant do to argument lists:

What you can’t do is put the argument sponge to the left of any default-valued arguments. If you do
this,
def broken_args(x,*y,z=1)
end

references in variable assignment and reassignments:

Every time you assign to a variable—every time you put a variable name to the left of an equal sign
and something else on the right—you start from scratch: the variable is wiped clean, and a new
assignment is made.

references and method arguments:

def change_string(str)
str.replace("New string content!")
end
Next, create a string and send it to change_string:
s = "Original string content!"
change_string(s)
Now, examine s:
puts s
The examination reveals that the contents of the string to
which s refers have changed:
New string content!

note replace doesnt change object_id
str = "damn"
puts str.object_id, str
str.replace("peanuts")
puts str.object_id, str

note: ruby is not weakly typed
puts "temp" + "dame" +  Object.new.object_id.to_s



you can protect objects from being changed by using dup:

s = "Oginal string content!"
change_string(s.dup)
puts s

pass a duplicate to function so s wont be changed

you can use freeze to prevent it from being changed:
s = "Original string content!"
s.freeze
change_string(s)

will throw errors

chapter 3 Organizing objects with classes

yes ruby has classes

when u define a method inline the class you dont need ticket.

instance methods:

so basically when you define a method inline a class, its
available to all Ticket objects, but you can create
instance methods for one particular ticket object
heres an example:

class Ticket
  def event
    "whatever"
  end
end

t1 = Ticket.new
t2 = Ticket.new

def t1.whatever
  puts "only t1"
end

if t1.respond_to?("whatever")
  t1.whatever
else
  puts "doesnt respond"
end

if t2.respond_to?("whatever")
  t1.whatever
else
  puts "doesnt respond"
end

overriding methods:

class C
  def m
    puts "First definition of method m"
  end
  def m
    puts "Second definition of method m"
  end
end

c.new.m

the printed result: Second definition of method m

reopening classes:

you can redefine classes again:

class C
  def x
  end
end

class C
  def y
  end
end

you usually do this if you define it
in multiple files

if you use require then it will merge definitions

Ruby is about objects, and objects are instances of classes

instances variables and object state:

he instance variable enables individual objects to remember state.
Instance variables work much
like other variables: you assign values to them, and you read
 those values back; you can add them
together, print them out, and so on. But instance variables have
a few differences:
Instance variable names always start with a single @ (at sign).
This enables you to recognize an
instance variable at a glance.

Instance variables are only visible to the object to which they belong.
(Being “visible to an
object” has a technical definition having to do with the default object
 self

An instance variable initialized in one method inside a class can be used by any method defined
within that class.

class Person
  def set_name(string)
    puts "setting person's name..."
    @name = string
  end

  def get_name
    puts "returning the person's name"
    @name
  end
end

joe = Person.new
joe.set_name("Joe")
puts joe.get_name


initializing an object with state

class Ticket
  def initialize(venue,date)
    @venue = venue
    @date = date
  end
  def venue
    @venue
  end

  def date
    @date
  end
end

setter methods

you can also have instance variables created and set later:

class Ticket
  def initialize(venue, date)
    @venue = venue
    @date = date
  end
  def set_price(amount)
    @price = amount
  end
  def price
    @price
  end
end

The equal sign (=) in method names
Ruby allows you to define methods that end with an equal sign (=). Let’s replace set_price with a
method called price= (“price” plus an equal sign):

def price=(amount)
@price = amount
end

we can use syntactic sugar with this:
ticket.price=(63.00)

ticket.price = 63.00

attributes and the attr_* method family

this:

class Ticket
  def initialize(venue, date)
    @venue = venue
    @date = date
  end
  def price=(price)
    @price = price
  end
  def venue
    @venue
  end
  def date
    @date
  end
  def price
    @price
  end
end

is the same as :

class Ticket
  attr_reader :venue, :date, :price
  attr_writer :price
  def initialize(venue, date)
    @venue = venue
    @date = date
  end
end
The elements that start with colons (:venue, and so on) are symbols.
 Symbols are a kind of naming or
labeling facility. They’re a cousin of strings, although not quite
the same thing


In the realm of object attributes, combination reader/writer attributes like
price are common. Ruby
provides a single method, attr_accessor, for creating both a
 reader and a writer method for an
attribute. attr_accessor is the equivalent of attr_reader plus
attr_writer.

class Ticket
  attr_reader :venue, :date
  attr_accessor :price
  # ... etc.
end

inheritance and the ruby class heiarchy:


In this example, Magazine inherits from Publication. Note the syntax in Magazine’s class
definition:

class Publication
  attr_accessor :publisher
end

class Magazine < Publication
  attr_accessor :editor
end


We can continue the cascade downward:
c
lass Ezine < Magazine
end


ruby does not allow multiple inheritance

Every class—Object, Person, Ticket—is an instance of a class called Class.
As you’ve already
seen, you can create a class object with the special class
keyword formula

my_class = Class.new

Class.new corresponds precisely to other constructor calls
like Object.new and Ticket.new.
When you instantiate the class Class, you create a class.
That class, in turn, can create instances of its
own:

instance_of_my_class = my_class.new

If you want to create an anonymous class using Class.new, and you also
 want to add instance
methods at the time you create it, you can do so by appending a code
 block after the call to new. A
code block is a fragment of code that you supply as part of a method
call, which can be executed from
the method:

c = Class.new do
  def say_hello
    puts "Hello!"
  end
end

how class objects call methods:

To understand where classes get their methods, think about where
objects in general get their methods
(minus modules, which we haven’t explored yet):
From their class
From the superclass and earlier ancestors of their class
From their own store of singleton methods (the “talk” in def obj.talk)


#creating anonymous class
a2 = Class.new do
  def bar
    puts "a2 function"
  end
end

a2.new.bar

class vs methods
#note f singleton method
class Ticket
  def foo
    puts "Ticket"
  end
end

a2 = Ticket.new

def Ticket.foobar
  puts "foobar"
end

a2.foobar #wont work since Ticket.foobar is a singleton method for the object
          #Ticket

#note this wont work either:

class Ticket
  def foo
    puts "Ticket"
  end
end

def Ticket.foobar
  puts "foobar"
end

a2 = Ticket.new
a2.foobar

#this will work:
class Ticket
  def foo
    puts "Ticket"
  end
end

class Ticket
  def foobar
    puts "foobar"
  end
end

a2 = Ticket.new
a2.foobar

we’ve defined a method that we can access through the class
object Ticket but not through its instances

Remember:
Classes are objects.
Instances of classes are objects, too.
A class object (like Ticket) has its own methods, its own state, and its own identity. It doesn’t
share these things with instances of itself. Sending a message to Ticket isn’t the same thing as
sending a message to fg or cc or any other instance of Ticket


(note THIS is not real code)
Here are some examples of this notation and what they refer to:
Ticket#price refers to the instance method price in the class Ticket.
Ticket.most_expensive refers to the class method most_expensive in the class Ticket.
Ticket::most_expensive also refers to the class method most_expensive in the class
Ticket.



=end
