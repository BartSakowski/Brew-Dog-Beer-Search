require_relative '../config/environment'
ActiveRecord::Base.logger = nil


puts "\e[H\e[2J"

puts "Welcome to your Brew Dog Beer Search!
\n
What's your full name?"

def username
  username = gets.chomp
end

session_user = find_user

age_limiter(session_user)
