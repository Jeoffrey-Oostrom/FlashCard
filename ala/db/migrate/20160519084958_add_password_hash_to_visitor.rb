class AddPasswordHashToVisitor < ActiveRecord::Migration
  def change
    add_column :visitors, :password_hash, :string
  end
end
