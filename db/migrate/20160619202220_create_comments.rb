class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :writer_id, null: false
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
