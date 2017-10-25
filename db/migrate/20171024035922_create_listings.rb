class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
    	t.string :title
    	t.string :description, limit: 500
    	t.string :property_type
    	t.integer :guests_capacity
    	t.integer :bedroom_number
    	t.decimal :bathroom, precision: 2, scale: 1
    	t.string :country
    	t.string :town_city
    	t.string :address
    	t.string :postcode
      t.timestamps
    end
  end
end
