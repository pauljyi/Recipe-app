require 'rails_helper'

describe "The posting of recipes" do
  it "should allow a user to enter a recipe" do
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
    click_button 'Create Recipe'
    page.should have_content 'myTitle'
    page.should have_content 'myAuthor'
    page.should have_content 'myIngredients'
    page.should have_content 'myInstructions'
    visit '/recipes'
    page.should have_content 'myTitle'
    page.should have_content 'myAuthor'
    page.should have_content 'myIngredients'
    page.should have_content 'myInstructions'
  end
end
