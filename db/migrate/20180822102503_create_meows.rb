class CreateMeows < ActiveRecord::Migration[5.2]
  def change
    create_table :meows do |t|
      t.string :title
      t.string :content
      t.string :url
      t.string :meow_type
      t.string :description
      t.integer :article_id

      t.timestamps
    end
    add_index :meows, :meow_type
    add_index :meows, :article_id
  end
end
