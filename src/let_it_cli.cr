require "colorize"
require "option_parser"

the_beatless = [
    "John Lennon",
    "Paul McCartney",
    "George Harrison",
    "Ringo Starr",
]

shout = strawberry = false
say_hi_to = ""

option_parser = OptionParser.parse do |parser|
    parser.banner = "#{"The Beatles".colorize(:yellow).on(:blue)} App"

    parser.on "-v", "--version", "Show version" do
        puts "version 1.0"
        exit
    end

    parser.on "-h", "--help", "Show help" do
        puts parser
        exit
    end

    parser.on "-t", "--twist", "Twist and SHOUT" do
        shout = true
    end

    parser.on "-g NAME", "--goodbye_hello=NAME", "Say hello to whoever you want" do |name|
        say_hi_to = name
    end

    parser.on "-r", "--random_goodbye_hello", "Say hello to one random member" do
        say_hi_to = the_beatless.sample
    end

    parser.on "-s", "--strawberry", "Strawberry fields forever mode ON" do
        strawberry = true
    end

    parser.missing_option do |option_flag|
        STDERR.puts "ERROR: #{option_flag} is not a valid option"
        STDERR.puts parser
        exit 1
    end
end

members = the_beatless
members = the_beatless.map &.upcase if shout

puts "Strawberry field forever mode ON" if strawberry

puts ""
puts "Group Members"
puts "============="
members.each do |member|
    puts "#{strawberry ? "🍓" : "-"} #{member}"
end

unless say_hi_to.empty?
    puts ""
    puts "You say goodbye, and I say hello to #{say_hi_to}!"
end
