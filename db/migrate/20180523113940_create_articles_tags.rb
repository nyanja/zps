class CreateArticlesTags < ActiveRecord::Migration[5.2]
  def change
    create_table :articles_tags do |t|
      t.belongs_to :article, index: true
      t.belongs_to :tag, index: true
    end
  end
end
