class FixDuplicateForeignKey < ActiveRecord::Migration[7.2]
  def change

    drop_table :books, if_exists: true # Ensures the table is dropped only if it exists

    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.string :synopsis
      t.integer :price_cents
      t.boolean :on_sale
      t.references :genre, null: false, foreign_key: true # Correctly adds the genre reference

      t.timestamps
    end
  end
end
