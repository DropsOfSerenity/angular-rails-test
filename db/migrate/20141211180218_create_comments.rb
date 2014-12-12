class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :votes
      t.references :post, index: true

      t.timestamps null: false
    end
  end
end
