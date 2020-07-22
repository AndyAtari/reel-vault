class AddTheaterColumnToFilms < ActiveRecord::Migration
  def change
    add_column :films, :theater, :string 
  end
end
