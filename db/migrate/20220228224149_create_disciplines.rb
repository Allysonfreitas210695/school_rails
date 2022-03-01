class CreateDisciplines < ActiveRecord::Migration[5.2]
  def change
    create_table :disciplines do |t|
      t.string :name
      t.string :department
      t.float :unity1
      t.float :unity2
      t.float :unity3

      t.timestamps
    end
  end
end
