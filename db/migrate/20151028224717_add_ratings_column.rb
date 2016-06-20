class AddRatingsColumn < ActiveRecord::Migration
  def change
    add_column :recipes, :ratings, :integer
  end
end
