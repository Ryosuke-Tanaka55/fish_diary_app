class CreateLeaders < ActiveRecord::Migration[6.0]
  def change
    create_table :leaders do |t|
      t.string :leader
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
