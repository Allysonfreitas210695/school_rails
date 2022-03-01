class AddDisciplineToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_reference :teachers, :discipline, foreign_key: true
  end
end
