class ArticlesController < ApplicationController
  
  def index
    @articles_all = Article.all # grabs all articles

    
  end
  
  def new
    @article = Article.new
  end

  # def create
  #   #render plain: params[:article].inspect
  #   @article = Article.new(article_params)
  #   @article.save
  #   redirect_to articles_path(@article) # redirects to article, passes in @article
  # end

  def create # Creates articles for 'new'
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

  def edit
    @article = Article.find(params[:id])
  end

  def update # Similar to create method, this updates for 'edit'
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end