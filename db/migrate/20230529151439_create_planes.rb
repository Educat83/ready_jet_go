class CreatePlanes < ActiveRecord::Migration[7.0]
  def change
    create_table :planes do |t|
      t.string :model
      t.string :location
      t.integer :pax_capacity
      t.float :fh_range
      t.float :fh_price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
