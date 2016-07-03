class RemovePasswordFromVisitor < ActiveRecord::Migration
  def change
    remove_column :visitors, :password
  end
end
