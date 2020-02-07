class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  # def create
  #   #render plain: params[:article].inspect
  #   @article = Article.new(article_params)
  #   @article.save
  #   redirect_to articles_path(@article) # redirects to article, passes in @article
  # end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id]) # This passes through the article ID to the 'show' view.
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end