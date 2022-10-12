class AddParentToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :parent_id, :bigint, null: true
  end
end
