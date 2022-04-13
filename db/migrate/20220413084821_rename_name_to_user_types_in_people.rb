class RenameNameToUserTypesInPeople < ActiveRecord::Migration[7.0]
  def change
    rename_column :people, :user_type, :user_types
  end
end
