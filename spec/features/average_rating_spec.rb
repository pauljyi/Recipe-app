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
    visit '/recipes'
    page.should have_content '3.0'
  end
end
