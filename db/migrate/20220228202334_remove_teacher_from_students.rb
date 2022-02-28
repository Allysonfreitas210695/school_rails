class RemoveTeacherFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_reference :students, :teacher, foreign_key: true
  end
end
