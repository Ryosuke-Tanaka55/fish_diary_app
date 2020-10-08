class CreateLures < ActiveRecord::Migration[6.0]
  def change
    create_table :lures do |t|
      t.string :lure_name
      t.string :lure_maker
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
