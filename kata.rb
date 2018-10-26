require 'rubygems'
require 'dish'

# Kata
var = ["var", "array", 1]
p = p var

# Iterate to screen
puts var
int = "interpolation"
p "This is called String #{int}"
p 'This is not called String #{interpolation}'

#puts "What do you think?"
#opinion = gets.chomp()
#puts "I agree with " + opinion

text = "Okada"
p text.upcase
p text

text = "Ishii"
p text.upcase!
p text

str = "     Sphinx of black quartz, judge my vow    "
p str.gsub! "black", "happy".strip
p str

# Split on space
p str.split

# Tokenize
p str.split(//)

def funky_weapon
  x = 10
  return ["KUSHIDA", "Tanahashi", "Elgin", "Finlay"] if x == 10
  ["KUSHIDA", "Tanahashi", "Juice"]
end

p funky_weapon

p "Astros".upcase
p "Astros".swapcase
p "Astros".reverse


str = "     Sphinx of black quartz, judge my vow    "
puts str.gsub("black", "happy").strip
puts str

full_name = Proc.new { |first, last| first + " " + last }
p full_name["Forename", "Surname"]
p full_name.call("Forename", "Surname")

fool_name = -> (first, last) { first + " " + last }
p fool_name["Nature", "Boy"]

def full_name printed_first:"Printy Value", printed_second:
p printed_first, printed_second
end
full_name printed_second:"sw"

def roster *splat
  # Equivalent of Java (String... args)
  puts splat
end


def full_roster **players_with_nicknames
  players_with_nicknames.each do |wrestler, nickname|
    puts "Wrestler: #{wrestler} - Nickname: #{nickname}"
    puts "\n"
  end
end

njpw = {
  "Okada": "Rainmaker",
  "Naito": "El Ingobernable",
  "Tanahashi": "The Ace",
  "Omega": "Best Bout Machine",
  "Ibushi": "Golden Star",
  "Ishii": "Stone Pitbull",
  "Elgin": "Big Mike",
  "EVIL": "King of Darkness"
}

full_roster njpw

i =0
while i < 10
  puts "Ruby makes the world go round"
  i+=1
end

arr = [1,2,3,4]

arr.each do |i|
  p i
end
#is same as
arr.each { |i| p i }

puts arr.select(&:even?)

for i in 0..24
  p i.to_s.reverse
end

titles= %w(All of these words become list elements)

r = {:a => "foo", :b => "bar", :lat => "123.52", :long => "33.212"}.map{|a, b| "#{a}=#{b}"}.join('&')
puts r

# + is amethod in Ruby
injectionValue =  [1,2,3,4].inject(&:+)
p injectionValue

r = [1,2,2,3]
r[7] = 78
p r
# Removes all 2s
p r.delete(2)

map = {key:"value", "key2"=>"value2", :key3=>"value3"}
puts map[:key]
puts map.keys
puts map.values

r = 34
if r == 44
  p r
else p 4 - 1
end

p "No match" unless r == 44

created_file = File.new("file", 'w+')
created_file.close()

10.times do
  sleep 0.001
  puts "File appended"
  File.open("file", "a") {|f| f.puts Time.new}
end

File.open("file", "a") {|f| f.puts ("Acid_Rainmaker_Is_Second_Rate_Toss")}
puts File.read("file").split("_")
File.delete("file")

def error_logger(e)
  File.open('error-log', 'a') do |file|
    file.puts e
  end
end

# Ruby try-catch
begin
  null + 10
rescue NameError => e
  error_logger("Error: #{e} at #{Time.now}")
end


# Aaaargh! Regex :-C
string = "12 Sphinxes of black quartz judge my 5 vows"

# Regex syntax: p =~ /*/
p string =~ /quartz/

p string =~ /s/ ? "Valid" : "Invalid"
p string =~ /s/i ? "Valid" : "Invalid"

p string.to_enum(:scan, /\d+/).map { Regexp.last_match }

VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
def is_valid_email(input)
  input =~ VALID_EMAIL_REGEX ? true : false
end

p is_valid_email("imaxwell@scottlogic.co.uk")
p is_valid_email("imaxwell@secureworks.com")
p is_valid_email("Ain't it sad?")

jsonhash = {
    "glossary": {
        "title": "example glossary",
		"GlossDiv": {
            "title": "S",
			"GlossList": {
                "GlossEntry": {
                    "ID": "SGML",
					"SortAs": "SGML",
					"GlossTerm": "Standard Generalized Markup Language",
					"Acronym": "SGML",
					"Abbrev": "ISO 8879:1986",
					"GlossDef": {
                        "para": "A meta-markup language, used to create markup languages such as DocBook.",
						"GlossSeeAlso": ["GML", "XML"]
                    },
					"GlossSee": "markup"
                }
            }
        }
    }
}

dishiHashi = Dish(jsonhash)
p dishiHashi.glossary.title
