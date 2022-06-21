require "option_parser"

the_beatless = [
    "John Lennon",
    "Paul McCartney",
    "George Harrison",
    "Ringo Starr"
]

shout = false

option_parser = OptionParser.parse do |parser|
    parser.banner = "Welcome to The Beatless App!"

    parser.on "-v", "--version", "Show version" do
        puts "version 1.0"
    end

    parser.on "-h", "--help", "Show help" do
        puts parser
        exit
    end

    parser.on "-t", "--twist", "Twist and SHOUT" do
        shout = true
    end
end

members = the_beatless
members = the_beatless.map &.upcase if shout

puts ""
puts "Group members"
puts "============="
members.each do |member|
    puts member
end