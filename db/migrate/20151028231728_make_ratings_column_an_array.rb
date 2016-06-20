class MakeRatingsColumnAnArray < ActiveRecord::Migration
  def change
    remove_column :recipes, :ratings
    add_column :recipes, :rating, :integer, array:true, default: []
  end
end
