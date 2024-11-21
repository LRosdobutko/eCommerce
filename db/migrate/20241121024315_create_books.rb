class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.string :synopsis
      t.integer :price
      t.boolean :on_sale

      t.timestamps
    end
  end
end
