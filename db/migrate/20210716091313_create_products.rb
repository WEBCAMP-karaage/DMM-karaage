class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.string :description, null: false
      t.integer :non_taxed_price, null: false
      t.boolean :sales_status, null: false, default: true
      t.string :image_id, null: false
      t.timestamps
    end
  end
end
