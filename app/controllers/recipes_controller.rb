class RecipesController < ApplicationController
  def index
  end

  def show
    #URLのところのIDを元にレシピの情報を取ってくる
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  #データベースにレシピを登録
  def create
    #フォームからのレシピの登録情報を取得
    @recipe = Recipe.new(recipe_params)
    #誰が投稿したのか
    @recipe.user_id = current_user.id
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  #コントローラーの中で飲み実行
  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :image)
  end
end
