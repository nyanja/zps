class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.integer :article_id, index: true
      t.integer :tag_id, index: true

      t.timestamps
    end
  end
end
