class RemoveSubjectFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :subject
  end
end
