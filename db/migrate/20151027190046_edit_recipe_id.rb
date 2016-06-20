class EditRecipeId < ActiveRecord::Migration
  def change
    remove_column :tags, :recipes_id
    add_column :tags, :recipe_id, :integer
  end
end
