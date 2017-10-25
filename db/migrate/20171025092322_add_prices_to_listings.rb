class AddPricesToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :prices, :string
  end
end
