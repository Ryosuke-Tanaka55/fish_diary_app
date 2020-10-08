class CreateColors < ActiveRecord::Migration[6.0]
  def change
    create_table :colors do |t|
      t.string :color_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
