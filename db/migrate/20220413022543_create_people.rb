class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.datetime :available_on
      t.integer :user_type
      t.timestamps
    end
  end
end
