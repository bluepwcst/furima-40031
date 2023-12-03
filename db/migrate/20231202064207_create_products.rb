class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_charge_id
      t.integer :region_id
      t.integer :delivery_time_id
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
