class AddLocationToListings < ActiveRecord::Migration
  def change
  	change_table :listings do |t|
    	t.string :location
    end
  end
end
