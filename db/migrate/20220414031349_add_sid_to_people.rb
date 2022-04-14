class AddSidToPeople < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :sid, :string
  end
end
