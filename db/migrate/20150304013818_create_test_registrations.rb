class CreateTestRegistrations < ActiveRecord::Migration
  def change
    create_table :test_registrations do |t|
      t.boolean :confirmed
      t.string :confirmation_status
      t.string :name

      t.timestamps
    end
  end
end
