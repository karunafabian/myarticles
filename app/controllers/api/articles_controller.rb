module Api
  class ArticlesController < ApplicationController
    def index
      articles = Article.order('created_at DESC');
      render json: {status: 'SUCCESS', message:'Loaded articles', data:articles}
    end

    def show
      article = Article.find(params[:id])
      render json: {status: 'SUCCESS', message:'Loaded articles', data:article}
    end

    def create
      article = Article.new(article_params)
      if article.save
      render json: {status: 'SUCCESS', message:'Saved article', data:article}
      else
        render json: {status: 'Error', message:'not Saved article', data:article.errors}
      end
    end

    def destroy
      article = Article.find(params[:id])
      article.destroy
      render json: {status: 'SUCCESS', message:'Deleted article', data:article}
    end

    private

    def article_params
      params.permit(:title, :body)
    end
  end
end