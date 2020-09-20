# frozen_string_literal: true

class InterestsController < ApplicationController
  def create
    @interest = current_user.interests.build(interest_params)
    if @interest.save
      flash[:success] = '気になるリストに追加しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = @interest.errors.full_messages
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @interest = current_user.interests.find_by(interest_params)
    @interest.destroy
    flash[:danger] = '気になるリストから削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def interest_params
    params.require(:interest).permit(:shop_id, :shop_name, :shop_url)
  end
end
