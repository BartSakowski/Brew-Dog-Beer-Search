def age_limiter(session_user) # prompts user to enter age, runs program if over 21, closes program if under 21
  puts "\e[H\e[2J"
  puts "Hi #{session_user.name}, please enter your age."
  user_input_chomp = gets.chomp
  user_input = user_input_chomp.to_f 
  if user_input > 20
    puts "\e[H\e[2J"
    puts "\nEnjoy Responsibly!"
    puts "\nWelcome, #{session_user.name}!\n"

    menu_prompt(session_user)
  else
    puts "\e[H\e[2J"
    puts "Come back when you are 21!\n"
  end
end