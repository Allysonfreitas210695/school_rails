class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.integer :registration, null: false
      
      t.timestamps
    end
  end
end
