class RemoveTtrFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :time_to_read, :string
  end
end
