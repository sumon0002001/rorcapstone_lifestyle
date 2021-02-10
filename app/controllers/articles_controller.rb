class ArticlesController < ApplicationController
  before_action :authorize, only: %i[index show new create]

  def index; end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash.notice = 'Article created!'
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @article = Article.includes(:comments, :author).find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image, category_ids: [])
  end
end
