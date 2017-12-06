class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
        @topics = Topic.all
        if params[:back]
                @topic = Topic.new(topics_params)
        else
                @topic = Topic.new
        end
  end
  
# showアククションを定義します。入力フォームと一覧を表示するためインスタンスを2つ生成します。
  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
  end

def create
      @topic = Topic.new(topics_params)
      @topic.user_id = current_user.id
   if @topic.save
      redirect_to topics_path, notice: "投稿しました！"
 ###   NoticeMailer.sendmail_topic(@topic).deliver
   else
     @topics = Topic.all
     render 'index'
   end
  end

  def edit
   if @topic.user_id == current_user.id
   else
    redirect_to topics_path, notice: "編集出来ません（投稿ユーザで再度ログインして下さい"
   end
  end

  def update
   if @topic.user_id == current_user.id
    @topic.update(topics_params)
    if @topic.save
      redirect_to topics_path, notice: "編集しました！"
    else
     render 'edit'
    end
   else
    redirect_to topics_path, notice: "編集出来ません（投稿ユーザで再度ログインして下さい"
   end
  end

  def destroy
   if @topic.user_id == current_user.id
    @topic.destroy
    redirect_to topics_path, notice: "削除しました！"
   else
    redirect_to topics_path, notice: "削除出来ません（投稿ユーザで再度ログインして下さい）"
   end
  end


  private
    def topics_params
      params.require(:topic).permit(:title, :content, :user_id, :image, :image_cache, :remove_image)
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end

end
