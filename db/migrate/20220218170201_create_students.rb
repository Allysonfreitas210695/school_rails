class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.integer :registration, null: false
      t.float :unity_one, default: 0
      t.float :unity_two, default: 0
      t.float :unity_three, default: 0
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
