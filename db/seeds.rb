require 'rest-client'
require 'json'
require 'pry'
require_relative '../lib/beer'
require_relative '../lib/user'
require_relative '../lib/user_beer'


url = "https://api.punkapi.com/v2/beers"

response = RestClient.get(url)

string_from_api = response.body

beer_hash = JSON.parse(string_from_api)

easy_beer = beer_hash.each do |beer|

  beer_name = beer["name"]
  beer_description = beer["description"]
  beer_abv = beer["abv"]
  food_pairings = beer['food_pairing'].join(', ')


 cool_beer_hash = {name: beer_name, description: beer_description, abv: beer_abv, food_pairing: food_pairings }

   Beer.create(cool_beer_hash)

end
