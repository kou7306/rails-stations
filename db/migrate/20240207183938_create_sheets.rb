class CreateSheets < ActiveRecord::Migration[6.1]
  def change
    create_table :sheets do |t|
      t.integer :column, limit: 5
      t.string :row

      t.timestamps
    end
    add_index :sheets, :column
    add_index :sheets, :row
  end
end
