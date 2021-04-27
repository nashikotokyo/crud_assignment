class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.text :post_id, null: false

      t.timestamps
    end
  end
end