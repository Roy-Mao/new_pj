class RemoveSidAndVerifiedFromPeople < ActiveRecord::Migration[7.0]
  def change
    remove_column :people, :sid
    remove_column :people, :verified
  end
end
