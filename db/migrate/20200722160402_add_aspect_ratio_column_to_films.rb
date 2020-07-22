class AddAspectRatioColumnToFilms < ActiveRecord::Migration
  def change
    add_column :films, :aspect_ratio, :string 
  end
end
