class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.string :title
      t.string :content
      t.string :url
      t.string :type
      t.string :description
      t.integer :article_id

      t.timestamps
    end
    add_index :ads, :type
    add_index :ads, :article_id
  end
end
