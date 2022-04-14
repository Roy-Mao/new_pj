class ChangeColumnNameToUserType < ActiveRecord::Migration[7.0]
  def change
    rename_column :people, :user_types, :user_type
  end
end
