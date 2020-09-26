class CreateRods < ActiveRecord::Migration[6.0]
  def change
    create_table :rods do |t|
      t.string :rod
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
