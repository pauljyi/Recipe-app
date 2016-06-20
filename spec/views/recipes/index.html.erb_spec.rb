require 'rails_helper'

RSpec.describe "recipes/index", type: :view do
  before(:each) do
    assign(:recipes, [
      Recipe.create!(
        :title => "Title",
        :author => "Author",
        :ingredients => "Ingredients",
        :instructions => "Instructions"
      ),
      Recipe.create!(
        :title => "Title",
        :author => "Author",
        :ingredients => "Ingredients",
        :instructions => "Instructions"
      )
    ])
  end

  it "renders a list of recipes" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Ingredients".to_s, :count => 2
    assert_select "tr>td", :text => "Instructions".to_s, :count => 2
  end
end
