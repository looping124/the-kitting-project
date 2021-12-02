class CreateJoinTableCategoriesItems < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_categories_items do |t|
      t.belongs_to :item, index: true
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
