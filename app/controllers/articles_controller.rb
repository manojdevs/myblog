class ArticlesController < ApplicationController
	
	def index
		if signed_in?
	@article=Article.all
end
	end
	def show
		if signed_in?
	@article=Article.find(params[:id])	
	@comment = Comment.new
    @comment.article_id = @article.id 	
end
	end
	def new
		if signed_in?
	@article=Article.new
end
	end
	def create
		if signed_in?
	@article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
end
	end
	def destroy
		if signed_in?
	article=Article.find(params[:id])
    article.destroy
    redirect_to articles_path
end
	end
	def edit
		if signed_in?
	 @article = Article.find(params[:id])	
	end
	end
	def update
		if signed_in?
	@article = Article.find(params[:id])
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
end
	end
	def article_params
    params.require(:article).permit(:title, :body,:image)
    end
    
end
