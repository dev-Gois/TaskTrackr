class CreateSubtasks < ActiveRecord::Migration[7.0]
  def change
    create_table :subtasks do |t|
      t.string :description
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
