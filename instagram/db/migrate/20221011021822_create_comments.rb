class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :post
      t.references :user
      t.timestamps
      t.string :comment_text
    end
  end
end
