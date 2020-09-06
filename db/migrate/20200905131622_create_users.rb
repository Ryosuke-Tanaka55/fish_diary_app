class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, presence: true
      t.string :email, presence: true
      t.string :tel
      t.string :prefecture
      t.string :image
      t.string :main_genre1
      t.string :main_genre2
      t.string :main_genre3
      t.text :introduction
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
