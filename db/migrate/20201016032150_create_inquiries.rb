class CreateInquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :inquiries do |t|
      t.string :inquiry_title
      t.text :inquiry_detail
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
