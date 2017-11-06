class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
    	t.integer :user_id
    	t.integer :listing_id
    	t.date :start_date
    	t.date :end_date
    	t.integer :number_of_guests
      t.timestamps
    end
  end
end
