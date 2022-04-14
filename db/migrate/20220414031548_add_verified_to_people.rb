class AddVerifiedToPeople < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :verified, :boolean
  end
end
