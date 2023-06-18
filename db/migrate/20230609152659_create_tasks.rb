class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :date
      t.boolean :completed, default: false
      t.boolean :favorited, default: false
      t.references :tag, null: true, default: nil
      t.references :list, null: true, default: nil
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
