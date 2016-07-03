class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.column :name, :string
      t.column :username, :string
      t.column :password, :string
      t.column :admin, :boolean

      t.timestamps null: false
    end
  end
end
