class AddCategoryToItem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :category, :integer
  end
end
