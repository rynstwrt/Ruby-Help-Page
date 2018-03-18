BEGIN {
	puts "I run first!"
}

END {
	puts "I run last!"
}

###########################
#         NAMING          #
###########################

=begin 
 • methods, variables, symbols use snake_case
 • classes, modules use CamelCase
 • files, dirs use snake_case
 • constants use SCREAMING_SNAKE_CASE
 • methods shouldn't be prefixed with id does, will
 	ex: is_tall?() is bad
 	ex: tall?() is good

=end

###########################
#        CLASSES          #
###########################
class Car
	def initialize(make, model, year)
		@make = make
		@model = model
		@year = year
	end

	def get_year()
		return @year
	end
end

my_car = Car.new('Honda', 'Civic', '2012')
puts my_car.get_year()

###########################
#         ARRAY           #
###########################

(1..10).each do |num|
	puts num
end


a, b, c = 40, 52, 341
puts a

a, b = b, a
puts a

###########################
#         LOOPS           #
###########################
i = 0
begin
	puts i
	i += 1
end while i < 5

i = 0
puts i += 1 while i < 5

i = 0
until i > 5 do
	puts i
	i += 1
end

i = 10
begin
	puts i
	i -= 1
end until i < 5

for i in 0...10
	puts i
end

(0...10).each do |i|
	puts i
end

###########################
#      FUNCS/ALIASES      #
###########################

def function1()
	puts "function 1"
end

alias function2 function1
function2()
undef function2
#function() <-- gives an error

###########################
#       FORMATTING        #
###########################

# string literal stuff
puts %Q{    nice } #equivalent to "    nice "
puts %x!dir!       #string literal

puts "ANNNDFSFDfasdfasfF".downcase.capitalize

###########################
#      ARRAYS/HASHES      #
###########################

puts "this will be binary".unpack 'B*'

a = [0, 12, 14, 16]
puts a.length
puts a.size
puts a[1]

# dictionaries, like HashMap/LinkedHashMap
my_days = Hash.new "days"
puts my_days[10]
puts my_days[1]

my_list = Hash[0 => "zero", 1 => "one"]
puts my_list
puts my_list[1]
puts my_list.keys
puts my_list.values
puts my_list.invert

###########################
#       TIME/LOCALE       #
###########################

current_time = Time.new
puts current_time
current_time = Time.now
puts current_time

epoch = Time.utc(1970, 1, 1, 0, 1)
puts epoch

###########################
#       to_a/to_s         #
###########################

puts (0..10).to_a
puts ('a'..'d').to_a #to_a converts an object to an array

class Animal
	def initialize(name)
		@name = name
	end
end

me = Animal.new "Ryan"
puts me.to_s #converts object to string

###########################
#        ITERATORS        #
###########################

#collect iterator returns all elements of collection
a = (1..10).to_a
b = Array.new
b = a.collect{}
puts b
b = a.collect{|x| x ** 2}
puts b

###########################
#         FILE/IO         #
###########################

#get value from input:
puts "Enter your name: "
#response = gets
response = nil
puts "Cool! My name is #{response} too!"

#puts statement: println
#print statement: print on same line
print "This is a print"
print "This is also a print"

=begin
TWO WAYS:
	- File.new w/ File.close: isn't a block
	- File.open: works in blocks
=end

my_file = File.new "input.txt", "r"
my_file.each do |x|
	puts x
end
my_file.close

#OR

my_file = File.open "input.txt", "r" do |file|
	file.each do |line| #alternatively, can do file.each_line
		puts line.reverse
	end
end

#use putc to print char
putc "Hello"
"World".each_byte {|x| puts x}

=begin
More advanced IO w/ writing uses sysread and syswrite
and IO.readlines, IO.foreach.

Also rename/delete with File.rename and File.delete

Can check if exists with File::exists?()

Can check if file with File.file?()

Can check readable, writeable, executable, zero file size
size, type, times for create modify and access,
create directory, create temp directory
=end

input = File.new "input.txt", "r+"
if input then
	input.syswrite "yo!"
	input.each_byte {|char| putc char; putc ?.}
end

line_array = IO.readlines "input.txt"
puts line_array[3]

chunks = IO.foreach("input.txt") {|chunk| puts chunk}

new_file = File.new "myfile.py", "w"
new_file.chmod 0755

puts File.file?(new_file)
puts File::exists?(new_file)
puts File::directory?("fake_directory")
puts File.zero? "input.txt"
puts File.size "input.txt"
puts File.ftype "input.txt"
puts File::ctime "input.txt"

current_dir = Dir.pwd
Dir.chdir "../"
puts %x!dir!
Dir.chdir current_dir
puts %x!dir!

if Dir.exists? "my_directory"
	Dir.delete "my_directory"
else
	newDir = Dir.mkdir "my_directory"
end


###########################
#       EXCEPTIONS        #
###########################
begin
	my_val = 10 / 0
rescue
	puts "I failed"
	#or raise "Error msg"
	#or raise ExceptionType, "error msg"
	#or raise ExceptionType, "error msg" condition
else
	puts "There was no error!"
ensure
	puts "This will always run"
end

#throw/catch used to jump around code

def my_func()
	if 1 == 1
		throw :my_exception
	end
end

my_catch = catch :my_exception do
	puts "I caught a throw statement!"
end

my_func()



