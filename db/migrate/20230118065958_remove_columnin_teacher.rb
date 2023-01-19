class RemoveColumninTeacher < ActiveRecord::Migration[6.1]
  def change
    remove_column :teachers, :student_id
  end
end
