class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :datein
      t.string :dateout

      t.timestamps
    end
  end
end
