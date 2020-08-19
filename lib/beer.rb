class Beer < ActiveRecord::Base
  has_many :user_beers 
  has_many :users, through: :user_beers

  def beer_name(beer_name)
    found_beer = Beer.find_by(name: beer_name)
    puts found_beer.name
    puts found_beer.description
  end

  

  # def beer_list(session_user)
  #   beer_list_array = User_Beer.where("user_id == #{session_user.id}")
  #   beer_id_array = []
  #   beer_list_array.each do |beers|
  #   beer_id_array << beers.beer_id
  #   end
  #   beer_instances = Beer.find(beer_id_array)
  #   beer_instances.each do |beer|
  #     puts "Beer Name: #{beer.name}"
  #     puts "Beer ID: #{beer.id}"
  #   end
  # end

end