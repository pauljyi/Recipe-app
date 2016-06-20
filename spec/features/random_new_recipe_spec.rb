require 'rails_helper'

describe "getting and displaying the average rating" do
  it "should average a recipes rating and display it" do
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
    page.should have_content 'Be the first to add a review'
    select '2', from: "rating_form"
    click_on 'Submit Rating'
    page.should have_content '2.0'
    select '4', from: "rating_form"
    click_on 'Submit Rating'
    page.should have_content '3.0'

    visit '/recipes/new'
    fill_in 'Title', :with => 'myTitle2'
    fill_in 'Author', :with => 'myAuthor2'
    fill_in 'Ingredients', :with => 'myIngredients2'
    fill_in 'Instructions', :with => 'myInstructions2'
    click_button 'Create Recipe'
    page.should have_content 'myTitle2'
    page.should have_content 'myAuthor2'
    page.should have_content 'myIngredients2'
    page.should have_content 'myInstructions2'
    page.should have_content 'Be the first to add a review'
    visit '/recipes'
    within ('table#recipes tr:nth-child(0) td:nth-child(5)') do
      page.should have_content 'New'
    end
    # page.should have_content ("tr:first-child")


  end
end
