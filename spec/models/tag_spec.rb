require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "should not accept an empty name" do
    aTag = Tag.new
    expect(aTag.valid?).to eq false
    aTag.name = "myTag"
    expect(aTag.valid?).to eq true
  end

  it "should have a recipe" do
    aTag = Tag.new
    aTag.name = "myTag"
    aRecipe = Recipe.new
    aTag.recipe = aRecipe
    expect(aTag.recipe).to eq aRecipe
  end

  it "should be able to find tags by name" do
    aTag = Tag.new
    aTag.name = "pizza"
    bTag = Tag.new
    bTag.name = "pizza"
    aTag.save
    bTag.save
    tagNames = Tag.where(:name => "pizza")
    expect(tagNames).to match_array [aTag, bTag]
  end
end
