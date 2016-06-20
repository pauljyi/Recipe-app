require 'rails_helper'

describe "user add image" do
  it "should check if the user can access new recipes once logged in and add image" do
    visit 'users/sign_up'
    fill_in 'Email', :with => "Chuck.Norris@gmail.com"
    fill_in 'Password', :with => "password"
    fill_in 'Password confirmation', :with => "password"
    click_button "Sign up"
    click_link "Enter Site"
    click_link "New Recipe"
    fill_in "Title", :with => 'myTitle'
    fill_in 'Author', :with => 'myAuthor'
    fill_in 'Ingredients', :with => 'myIngredients'
    fill_in 'Instructions', :with => 'myInstructions'
    # click_button 'recipe[image]'
    attach_file('Image', '/Users/learn11/Desktop/burritos.jpg')
    click_button 'Create Recipe'
    # page.should have_content "Rate This Recipe"
    # page.should have_xpath "//img[@src='/system/recipes/images/000/000/030/large/burritos.jpg?1446489796']"
    # page.should have_css('img', text: "burritos.jpg.")
    # page.should have_css('img', :text => "/system/recipes/images/000/000/030/large/burritos.jpg")
    expect(page).to have_xpath("//img[contains(@src, 'burritos.jpg')]")
  end
end
