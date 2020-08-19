def find_user # finds the user
  User.find_or_create_by(name: username)
end

def beer_list(session_user) # shows user's beer list
  beer_list_array = User_Beer.where("user_id == #{session_user.id}")
  beer_id_array = []
  beer_list_array.each do |beers|
  beer_id_array << beers.beer_id
  end
  beer_instances = Beer.find(beer_id_array)
  beer_instances.each do |beer|
    puts "Beer Name: #{beer.name}"
    puts "Beer ID: #{beer.id}"
    puts "Beer ABV: #{beer.abv}"
    puts "Beer Description: #{beer.description}"
  end
end

def enter_to_continue # puts the below string, used after a menu option
  puts "<<< press 'enter' to continue >>>"
  user_input = gets.chomp
end

def enter_to_reset
  puts "<<< press 'enter' to search for another beer >>>"
  user_input = gets.chomp
end

def what_else(session_user) # gets user back to main menu
  puts "\e[H\e[2J"
  puts "What else would you like to do?"
  menu_prompt(session_user)
end

def beer_search_loop(session_user)
  loop do
    puts "\e[H\e[2J"
    puts "Please enter a beer name or type 'return' to return to menu"
    user_input = gets.chomp
    result = Beer.find_by(name: user_input)
    if Beer.exists?(name: user_input)
      puts "\e[H\e[2J"
      puts "Here's the information you were looking for!"
      puts "Name: #{result.name}"
      puts "ID: #{result.id}"
      puts "Description: #{result.description}"
      puts "ABV: #{result.abv}"
      puts "Food Pairing: #{result.food_pairing}"
      puts "\n"
      break 
    elsif user_input == "return"
      what_else(session_user)
      break
    elsif not Beer.exists?(name: user_input)
      puts "We can't find that one, check your spelling!"
      break
    end
  end
  enter_to_reset
  beer_search_loop(session_user)
end


def beer_abv_loop(session_user)
  puts "\e[H\e[2J"
    puts "Enter the ABV of the beer(s) you want"
    user_input_chomp = gets.chomp
    user_input = user_input_chomp.to_f 
    user_input_plus =  (user_input + 0.3)
    user_input_minus = (user_input - 0.3)
    result = Beer.where(abv: (user_input_minus)..(user_input_plus)).as_json
    puts "\e[H\e[2J"
    puts "Here are the beer(s) with #{user_input}% abv:"
      result.each do |beer|
        puts "\nName: #{beer['name']}"
        puts "Description: #{beer['description']}"
        puts "ABV: #{beer['abv']}"
        puts "Food Pairing: #{beer['food_pairing']} \n"
        
        # break
      end
    enter_to_continue
    what_else(session_user)
end