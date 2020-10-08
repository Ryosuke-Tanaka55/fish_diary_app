class CreateReels < ActiveRecord::Migration[6.0]
  def change
    create_table :reels do |t|
      t.string :reel_name
      t.string :reel_maker
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
