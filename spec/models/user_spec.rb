require 'rails_helper'

RSpec.describe User, type: :model do
  it "should be able to sign up and log it" do
    visit 'users/sign_up'
    fill_in 'Email', :with => "Chuck.Norris@gmail.com"
    fill_in 'Password', :with => "password"
    fill_in 'Password confirmation', :with => "password"
    click_button "Sign up"
    page.should have_content "Welcome To The Recipe App"
    page.should have_content "chuck.norris@gmail.com"
  end
end
