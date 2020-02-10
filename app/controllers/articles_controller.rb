class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  # The above code replaces the line @article = Article.find(params[:id]) in methods edit, update, show, destroy and instead uses method set_article with the same code.
  
  def index
    @articles = Article.all # grabs all articles
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
    @article.user = User.first
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show # This passes through the article ID to the 'show' view.
  end

  def destroy
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end

  def edit
  end

  def update # Similar to create method, this updates for 'edit'
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
    def set_article
      @article = Article.find(params[:id])
    end

end