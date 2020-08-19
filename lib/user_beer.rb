class User_Beer < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer
end