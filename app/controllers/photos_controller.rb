class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo, only: [:edit, :update, :destroy]

  def index
        @photos = Photo.all
        if params[:back]
                @photo = Photo.new(photos_params)
        else
                @photo = Photo.new
        end
  end

  def create
      @photo = Photo.new(photos_params)
      @photo.user_id = current_user.id
   if @photo.save
      redirect_to photos_path, notice: "投稿しました！"
      NoticeMailer.sendmail_photo(@photo).deliver
   else
     @photos = Photo.all
     render 'index'
   end
  end

  def edit
  end

  def update
    @photo.update(photos_params)
    if @photo.save
      redirect_to photos_path, notice: "編集しました！"
    else
     render 'edit'
    end
  end 

  def destroy
    @photo.destroy
    redirect_to photos_path, notice: "削除しました！"
  end 

#  def confirm
#    @photo = Photo.new(photos_params)
#    @photos = Photo.all  if @photo.invalid?
#    render :index if @photo.invalid?
#  end

  private
    def photos_params
      params.require(:photo).permit(:content, :user_id) 
    end

    def set_photo
      @photo = Photo.find(params[:id])
    end
end
