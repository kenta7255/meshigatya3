class PostsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    @id = params[:id]
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @interest = current_user.interests.find_by(delete_interest_prm)
    @interest.destroy if @interest
    if @post.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to user_url(@post.user)
    else
      flash[:danger] = @post.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def post_params
    params.require(:post).permit(:content,:eval,:shop_id,:shop_name,:shop_url,:shop_station)
  end
  
  def delete_interest_prm
    params.require(:post).permit(:shop_id,:shop_name,:shop_url)
  end
end
