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


=end
