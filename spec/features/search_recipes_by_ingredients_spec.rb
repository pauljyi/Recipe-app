require 'rails_helper'

describe "search recipes by ingredients" do
  it "should have an empty search bar" do
    visit 'users/sign_up'
    fill_in 'Email', :with => "Chuck.Norris@gmail.com"
    fill_in 'Password', :with => "password"
    fill_in 'Password confirmation', :with => "password"
    click_button "Sign up"
    click_link "Enter Site"
    click_link 'Search Recipes by Ingredients'
    expect(find_field('Enter Ingredient Name:').value).to eq nil
    page.should have_no_content 'Recipes found:'
    page.should have_no_content 'No Recipes Found'
  end

  it "should tell us no recipes where found if there are no matching recipes" do
    aRecipe = Recipe.new
    aRecipe.title = 'Beef Stew'
    aRecipe.author = 'Steve'
    aRecipe.ingredients = 'beef, stew'
    aRecipe.instructions = "Do the things"
    aTag = Tag.new
    aTag.name = 'beef'
    aTag.save
    aRecipe.tags << aTag
    aRecipe.save

    visit 'users/sign_up'
    fill_in 'Email', :with => "Chuck.Norris@gmail.com"
    fill_in 'Password', :with => "password"
    fill_in 'Password confirmation', :with => "password"
    click_button "Sign up"
    click_link "Enter Site"
    click_link 'Search Recipes by Ingredients'

    fill_in 'Enter Ingredient Name:', :with => 'chicken'
    click_button("Search")
    page.should have_content 'No Recipes Found'
    page.should have_no_content 'Recipes found:'
  end
  #
  it "should display recipes corresponding to ingredient search" do
    aRecipe = Recipe.new
    aRecipe.title = 'Beef Stew'
    aRecipe.author = 'Steve'
    aRecipe.ingredients = 'beef, stew'
    aRecipe.instructions = "Do the things"
    aTag = Tag.new
    aTag.name = 'beef'
    aTag.save
    aRecipe.tags << aTag
    aRecipe.save

    visit 'users/sign_up'
    fill_in 'Email', :with => "Chuck.Norris@gmail.com"
    fill_in 'Password', :with => "password"
    fill_in 'Password confirmation', :with => "password"
    click_button "Sign up"
    click_link "Enter Site"
    click_link 'Search Recipes by Ingredients'

    fill_in 'Enter Ingredient Name:', :with => 'beef'
    click_button("Search")
    page.should have_content 'Beef Stew'
    page.should have_no_content 'No Recipes Found'

  end
end
