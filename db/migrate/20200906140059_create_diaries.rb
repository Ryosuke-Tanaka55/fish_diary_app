class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.string :title
      t.datetime :fish_at
      t.string :fish_name
      t.decimal :size
      t.decimal :weight
      t.string :count
      t.string :photo
      t.string :place
      t.string :place_detail
      t.float :diary_latitude
      t.float :diary_longitude
      t.string :area
      t.string :range
      t.string :tackle_action
      t.string :speed
      t.text :situation
      t.text :diary_note
      t.string :publish
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
