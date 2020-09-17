class CreateTackles < ActiveRecord::Migration[6.0]
  def change
    create_table :tackles do |t|
      t.string :rod
      t.string :reel
      t.string :line
      t.string :leader
      t.string :lure
      t.string :color
      t.string :bait
      t.string :hook
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
