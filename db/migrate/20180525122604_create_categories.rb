class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug, index: true
      t.integer :position

      t.timestamps
    end

    add_column :articles, :category_id, :integer, index: true
  end
end
