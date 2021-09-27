class TweetsController < ApplicationController
  def index
    @tweet = Tweet.all 
  end
  def new
    @tweet = Tweet.new
  end
  def create
    @tweet = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
    if @tweet.save
      flash[:notice] = '投稿しました'
      redirect_to root_path
    else
      render 'new'
    end
  end
  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy
      flash[:notice] = '削除しました'
    end
    redirect_to root_path
  end
  def show
    @tweet = Tweet.find(params[:id])
  end
  def edit
    @tweet = Tweet.find(params[:id])
  end
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(message: params[:tweet][:message])
      flash[:notice] = '更新しました'
      redirect_to root_path
    else
      render 'edit'
    end
  end
end
