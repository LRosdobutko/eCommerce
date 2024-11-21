class DestroyGenresTable < ActiveRecord::Migration[7.2]
  def change
    # Remove the foreign key constraint on the products table
    remove_foreign_key :products, :genres if foreign_key_exists?(:products, :genres)

    # Optionally, remove the genre_id column if it's no longer needed
    remove_column :products, :genre_id
  end
end
