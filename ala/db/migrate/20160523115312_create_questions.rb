class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :question, :string
      t.column :answer, :string

      t.timestamps null: false
    end
  end
end
