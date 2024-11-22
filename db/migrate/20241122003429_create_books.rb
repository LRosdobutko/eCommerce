class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :synopsis
      t.integer :price_cents
      t.boolean :on_sale
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
