class AddTimeToReadToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :time_to_read, :string
    add_column :articles, :views_count, :integer, default: 0
  end
end
