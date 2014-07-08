class AddDescAndPriceToListings < ActiveRecord::Migration
  def change
  	change_table :listings do |t|
    	t.string :description
    	t.float :price
    end
  end
end
