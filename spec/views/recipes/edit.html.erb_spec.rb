require 'rails_helper'

RSpec.describe "recipes/edit", type: :view do
  before(:each) do
    @recipe = assign(:recipe, Recipe.create!(
      :title => "MyString",
      :author => "MyString",
      :ingredients => "MyString",
      :instructions => "MyString"
    ))
  end

  it "renders the edit recipe form" do
    render

    assert_select "form[action=?][method=?]", recipe_path(@recipe), "post" do

      assert_select "input#recipe_title[name=?]", "recipe[title]"

      assert_select "input#recipe_author[name=?]", "recipe[author]"

      assert_select "input#recipe_ingredients[name=?]", "recipe[ingredients]"

      assert_select "input#recipe_instructions[name=?]", "recipe[instructions]"
    end
  end
end
