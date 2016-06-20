class AddRecipeIdToTag < ActiveRecord::Migration
  def change
    add_column :tags, :recipes_id, :integer
  end
end
