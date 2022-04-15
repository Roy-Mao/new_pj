class DropOneTimePasswordsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :one_time_passwords
  end
end
