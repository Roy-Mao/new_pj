class CreateOneTimePasswords < ActiveRecord::Migration[7.0]
  def change
    create_table :one_time_passwords do |t|
      t.timestamps
    end
  end
end
