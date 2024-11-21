class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price_cents
      t.references :Genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end