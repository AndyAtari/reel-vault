class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.string :genre
      t.string :gauge
      t.string :condition
      t.integer :reels
      t.integer :length
      t.integer :user_id 
    end
  end
end
