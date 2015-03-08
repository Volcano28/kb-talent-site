class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :email
      t.string :phone_number
      t.string :video
      t.string :first_mp3
      t.string :second_mp3
      t.boolean :agreed_to_terms
      t.boolean :payment_confirmed

      t.timestamps
    end
  end
end
