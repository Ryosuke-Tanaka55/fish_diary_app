class CreateInquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :inquiries do |t|
      t.string :email
      t.string :inquiry_title
      t.text :inquiry_detail

      t.timestamps
    end
  end
end
