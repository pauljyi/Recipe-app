require 'rails_helper'

describe "search recipes by tag" do
  it "should have an empty search bar" do
    visit 'tags/search'
    expect(find_field('Enter Tag Name:').value).to eq nil
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

    visit 'tags/search'
    fill_in 'Enter Tag Name:', :with => 'chicken'
    click_button("Search")
    page.should have_content 'No Recipes Found'
    page.should have_no_content 'Recipes found:'
  end

  it "should display recipes corresponding to tag search" do
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

    visit 'tags/search'
    fill_in 'Enter Tag Name:', :with => 'beef'
    click_button("Search")
    page.should have_content 'Recipes found:'
    page.should have_content 'Beef Stew'
    page.should have_no_content 'No Recipes Found'

  end
end
