class User < ActiveRecord::Base
  has_many :user_beers
  has_many :beers, through: :user_beers
end
