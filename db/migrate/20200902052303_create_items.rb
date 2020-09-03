class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :image,            null: false
      t.string :name,             null: false
      t.string :description,      null: false
      t.integer :category_id,        null: false
      t.integer :status_id,          null: false
      t.integer :shipping_charge_id, null: false
      t.integer :area_id,            null: false
      t.integer :shipping_time_id,   null: false
      t.integer :price,           null: false
      t.integer :user_id,         foreign_key: true
      

      t.timestamps
    end
  end
end