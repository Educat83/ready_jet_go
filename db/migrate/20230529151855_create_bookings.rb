class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.float :total_hours
      t.float :total_price
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :plane, null: false, foreign_key: true

      t.timestamps
    end
  end
end
