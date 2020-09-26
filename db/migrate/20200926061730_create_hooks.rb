class CreateHooks < ActiveRecord::Migration[6.0]
  def change
    create_table :hooks do |t|
      t.string :hook
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
