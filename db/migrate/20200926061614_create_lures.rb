class CreateLures < ActiveRecord::Migration[6.0]
  def change
    create_table :lures do |t|
      t.string :lure
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
