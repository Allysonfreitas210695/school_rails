class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.integer :registration, null: false
      t.string :department, null: false, default: ''
      t.string :discipline, null: false, default: ''

      t.timestamps
    end
  end
end
