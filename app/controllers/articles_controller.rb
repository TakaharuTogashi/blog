class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.order("id DESC").page(params[:page]).per(10)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash.notice = '投稿しました'
      redirect_to @article
    else
      flash.now[:alert] = '投稿に失敗しました'
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash.notice = '更新しました'
      redirect_to @article
    else
      flash.now[:alert] = '更新に失敗しました'
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash.notice = '削除しました'
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
