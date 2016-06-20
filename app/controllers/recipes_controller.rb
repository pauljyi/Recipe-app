class RecipesController < ApplicationController
  before_filter :authenticate_user!, except: [:landing, :index]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]


  def landing
  end

  def add_tag
    @recipe = Recipe.find(params[:id])
    newTag = Tag.new(params[:tag])
    @tag = newTag.id
    if newTag.valid?
      newTag.save
      @recipe.tags << newTag
      @recipe.save
    end
    render 'show.html.erb'
  end

  def search_by_ingredients
    if !params[:search_string].nil?
      search_string = params[:search_string].strip
      @recipe = Recipe.basic_search(ingredients: search_string)
    end
  end

  def index
    @recipes = Recipe.all.order("-average_rating ASC")
    null_array = Recipe.where(:rating => '{}')
    if null_array != nil
      random_new = null_array.sample
      # @recipes.delete(random_new)
      @recipes.unshift(random_new)
    end
  end

  def show
    if @recipe.rating.length != 0
    @recipe.average_rating
    end
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def rating
    @recipe = Recipe.find(params[:id])
    rating_form = params[:rating_form].to_i
    @recipe.rating << rating_form
    @recipe.average_rating = @recipe.rating.sum.to_f / @recipe.rating.length.to_f
    @recipe.save
    render 'show.html.erb'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title, :author, :ingredients, :instructions, :image)
    end
end
