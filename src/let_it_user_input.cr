require "colorize"

puts "Welcome to The Beatless Sing-Along version 1.0"
puts "Enter a phrase you want The Beatless to sing"
puts "> "
user_input = gets

exit if user_input.nil? # Ctrl+D

default_lyrics = "Na, na, na, na-na-na na" \
                 " / " \
                 "Na-na-na na, hey Jude"

lyrics = user_input.presence || default_lyrics

puts "The Beatless are singing: #{"🎵#{lyrics}🎶🎸🥁".colorize.fore(:yellow).mode(:blink).mode(:bright)}"
