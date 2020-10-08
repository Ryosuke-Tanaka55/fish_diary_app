class CreateRigs < ActiveRecord::Migration[6.0]
  def change
    create_table :rigs do |t|
      t.string :rig_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
