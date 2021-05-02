class CreateBookComents < ActiveRecord::Migration[5.2]
  def change
    create_table :book_coments do |t|
      t.text :coment
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
