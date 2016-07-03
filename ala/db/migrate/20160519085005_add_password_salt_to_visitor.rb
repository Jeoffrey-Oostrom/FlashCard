class AddPasswordSaltToVisitor < ActiveRecord::Migration
  def change

    add_column :visitors, :password_salt, :string
  end
end
