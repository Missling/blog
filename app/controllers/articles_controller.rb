class ArticlesController < ApplicationController
  # user must be authenticated on every action except index and show
  http_basic_authenticate_with name: "ling", password: "password", except: [:index, :show]

  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(
      title: params[:article][:title],
      text: params[:article][:text]
    )

    # The render method is used so that the @article object is passed back to the new template when it is rendered. This rendering is done within the same request as the form submission, whereas the redirect_to will tell the browser to issue another request.
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(
        title: params[:article][:title],
        text: params[:article][:text]
      )
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end
end
