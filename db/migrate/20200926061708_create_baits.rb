class CreateBaits < ActiveRecord::Migration[6.0]
  def change
    create_table :baits do |t|
      t.string :bait_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
