class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.column :subjects, :string

      t.timestamps null: false
    end
  end
end
