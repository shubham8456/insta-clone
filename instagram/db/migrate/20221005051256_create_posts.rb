class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :media
      t.string :media_type
      t.string :caption
      t.boolean :active
      t.timestamps
      t.references :user
    end
  end
end
