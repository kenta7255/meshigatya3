# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_user_logged_in, only: %i[show index]
  before_action :set_user, only: %i[show destroy edit update interests]

  def show
    # @posts = Post.where(user_id: @user.id).order(id: :desc).page(params[:page])
    @posts = @user.posts.order(id: :desc).page(params[:page]).per(15)
    # 駅ベースで投稿数を割り出し
    count = @user.posts.group(:shop_station).count
    # 一番訪れた駅から属性決定
    station = count.invert[count.values.sort.reverse.shift]
    # 本当はstationが変わった時だけにしたい。。。
    @user.update(area: station)

    array = []
    not_current_user = User.where.not(id: current_user.id)
    not_current_user.each do |user|
      array.push(user) if user.posts.where(shop_station: station).count >= 5
    end
    @sim_users = array.sample(3)
  end

  def new
    @user = User.new
  end

  def index
    @users = User.where.not(id: current_user.id).page(params[:page])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    # URL直打ちで他ユーザーの編集画面に飛んだ場合
    unless current_user == @user
      # flash[:danger] = '他のユーザーのプロフィールは編集できません。'
      redirect_to user_url(current_user)
    end
  end

  def update
    if @user.update(edit_params)
      flash[:success] = 'プロフィールを更新しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'プロフィールの更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @users.destroy
    flash[:success] = 'ユーザーは正常に削除されました'
    redirect_to root_url
  end

  def interests
    @interests = @user.interests.order(id: :desc).page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :profile)
  end

  def edit_params
    params.require(:user).permit(:image, :profile)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
