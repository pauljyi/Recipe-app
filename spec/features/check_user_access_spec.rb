require 'rails_helper'

describe "user access" do
  it "should check if the user can access new recipes once logged in" do
    visit 'users/sign_up'
    fill_in 'Email', :with => "Chuck.Norris@gmail.com"
    fill_in 'Password', :with => "password"
    fill_in 'Password confirmation', :with => "password"
    click_button "Sign up"
    click_link "Enter Site"
    click_link "New Recipe"
    page.should have_content "New Recipe"
  end
end
