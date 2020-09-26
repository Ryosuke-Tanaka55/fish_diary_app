class CreateLines < ActiveRecord::Migration[6.0]
  def change
    create_table :lines do |t|
      t.string :line
      t.string :line_maker
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
