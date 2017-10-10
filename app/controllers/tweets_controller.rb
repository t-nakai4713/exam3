class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]

  def index
	@tweets = Tweet.all
	if params[:back]
		@tweet = Tweet.new(tweets_params)
	else
		@tweet = Tweet.new
  	end
  end


  def create
      @tweet = Tweet.new(tweets_params)
   if @tweet.save
      redirect_to tweets_path, notice: "投稿しました！"
   else
     @tweets = Tweet.all
     render 'index'
   end
  end

  def edit
#    @tweet = Tweet.find(params[:id])
  end

  def update
#    @tweet = Tweet.find(params[:id])
    @tweet.update(tweets_params)
    if @tweet.save
      redirect_to tweets_path, notice: "編集しました！"
    else
     render 'edit'
    end
  end 

  def destroy
#    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, notice: "削除しました！"
  end 

  def confirm
    @tweet = Tweet.new(tweets_params)
    @tweets = Tweet.all  if @tweet.invalid?
    render :index if @tweet.invalid?
  end

  private
    def tweets_params
      params.require(:tweet).permit(:content) 
    end

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

end
