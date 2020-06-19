class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :text
      t.boolean :complited, default: false
      t.references :project, index: true, foreign_key: true

      t.timestamps
    end
  end
end
