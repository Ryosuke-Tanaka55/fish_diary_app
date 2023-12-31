class CreateRods < ActiveRecord::Migration[6.0]
  def change
    create_table :rods do |t|
      t.string :rod_name
      t.string :rod_maker
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
