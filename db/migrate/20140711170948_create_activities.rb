class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :student_id
      t.string :status
      t.string :destination

      t.timestamps
    end
  end
end
