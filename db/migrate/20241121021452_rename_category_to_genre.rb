class RenameGenreToGenre < ActiveRecord::Migration[7.0]
  def change
    drop_table :genres, if_exists: true

    rename_table :genres, :genres
    rename_column :products, :Genre_id, :genre_id
    add_foreign_key :products, :genres
  end
end
