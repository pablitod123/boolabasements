class AddUserIdToRequests < ActiveRecord::Migration
  def change
    change_table :requests do |t|
    	t.belongs_to :user 
    end
  end
end
