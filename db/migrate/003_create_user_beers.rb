class CreateUserBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_beers do |t|
      t.integer :user_id
      t.integer :beer_id
      t.integer :rating
      t.string :personal_pairing
    end
  end
end