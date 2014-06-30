class AddDateinDateoutToListing < ActiveRecord::Migration
  def change
  	change_table :listings do |t|
    	t.belongs_to :user
    	t.string :datein
    	t.string :dateout 	
    end
  end
end
