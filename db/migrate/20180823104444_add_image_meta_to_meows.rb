class AddImageMetaToMeows < ActiveRecord::Migration[5.2]
  def change
    add_column :meows, :image_alt, :string
    add_column :meows, :image_title, :string
  end
end
