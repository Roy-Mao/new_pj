class CreateOneTimeTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :one_time_tokens do |t|
      t.belongs_to :person, foreign_key: true
      t.string :token
      t.boolean :status
      t.timestamps
    end
  end
end
