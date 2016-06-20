require 'rails_helper'

describe "add tag to recipe" do
  it "should allow a user to enter a tag for a recipe" do
    visit 'users/sign_up'
    fill_in 'Email', :with => "Chuck.Norris@gmail.com"
    fill_in 'Password', :with => "password"
    fill_in 'Password confirmation', :with => "password"
    click_button "Sign up"
    visit '/recipes/new'
    fill_in 'Title', :with => 'myTitle'
    fill_in 'Author', :with => 'myAuthor'
    fill_in 'Ingredients', :with => 'myIngredients'
    fill_in 'Instructions', :with => 'myInstructions'
    click_button "Create Recipe"
    fill_in 'Tag', :with => 'myTag'
    click_button 'Add Tag'
    page.should have_content 'myTag'
  end
end
