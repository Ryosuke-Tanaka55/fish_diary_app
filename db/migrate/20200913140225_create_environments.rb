class CreateEnvironments < ActiveRecord::Migration[6.0]
  def change
    create_table :environments do |t|
      t.string :weather
      t.decimal :temperature
      t.decimal :wind_speed
      t.string :tide
      t.string :tide_current
      t.decimal :water_temperature
      t.string :water_quality
      t.references :diary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
