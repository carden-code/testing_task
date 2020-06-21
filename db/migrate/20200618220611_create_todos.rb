class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :text, null: false, unique: true
      t.boolean :complited, default: false
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
