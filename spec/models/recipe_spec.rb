require 'rails_helper'

describe Recipe do
  it "should have a title" do
    aRecipe = Recipe.new
    aRecipe.title = "Title"
    expect(aRecipe.title).to eq "Title"
  end

  it "should not accept an empty title" do
    aRecipe = Recipe.new
    aRecipe.ingredients = 'x'
    aRecipe.instructions = 'y'
    expect(aRecipe.valid?).to eq false
    aRecipe.title = 'z'
    expect(aRecipe.valid?).to eq true
  end

  it "should accept a rating" do
    aRecipe = Recipe.new
    aRecipe.rating = 1
    expect(aRecipe.rating).to eq 1
  end
end
