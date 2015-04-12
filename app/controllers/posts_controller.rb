class PostsController < ApplicationController
  respond_to :json

  def index
    respond_with Post.search(params[:q]).result(distinct: true)
  end

  def create
    respond_with Post.create!(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:author, :body)
  end
end
