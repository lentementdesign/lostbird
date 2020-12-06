class PetsController < ApplicationController
  def index
    if params[:keyword].present? && params[:prefecture] != "都道府県を選択" && params[:prefecture].present? && params[:status] == "迷子"
      @pets = Pet.kind_like(params[:keyword]).prefecture_match(params[:prefecture]).where(status: "迷子").order(created_at: "DESC")
    elsif params[:keyword].present? && params[:prefecture] != "都道府県を選択" && params[:prefecture].present? && params[:status] == "保護"
      @pets = Pet.kind_like(params[:keyword]).prefecture_match(params[:prefecture]).where(status: "保護").order(created_at: "DESC")
    elsif params[:keyword].present? && params[:prefecture] != "都道府県を選択" && params[:prefecture].present? && params[:status] == "すべてのステータス"
      @pets = Pet.kind_like(params[:keyword]).prefecture_match(params[:prefecture]).order(created_at: "DESC")
    elsif params[:keyword].present? && params[:prefecture] != "都道府県を選択" && params[:status] == "迷子"
      @pets = Pet.kind_like(params[:keyword]).where(status: "迷子").order(created_at: "DESC")
    elsif params[:keyword].present? && params[:prefecture] != "都道府県を選択" && params[:status] == "保護"
      @pets = Pet.kind_like(params[:keyword]).where(status: "保護").order(created_at: "DESC")
    elsif params[:keyword].present? && params[:prefecture] != "都道府県を選択" && params[:status] == "すべてのステータス"
      @pets = Pet.kind_like(params[:keyword]).order(created_at: "DESC")
    elsif params[:prefecture].present? && params[:prefecture] != "都道府県を選択" && params[:status] == "迷子"
      @pets = Pet.prefecture_match(params[:prefecture]).where(status: "迷子").order(created_at: "DESC")
    elsif params[:prefecture].present? && params[:prefecture] != "都道府県を選択" && params[:status] == "保護"
      @pets = Pet.prefecture_match(params[:prefecture]).where(status: "保護").order(created_at: "DESC")
    elsif params[:prefecture].present? && params[:prefecture] != "都道府県を選択" && params[:status] == "保護"
      @pets = Pet.prefecture_match(params[:prefecture]).order(created_at: "DESC")
    elsif params[:status] == "保護"
      @pets = Pet.where(status: "保護").order(created_at: "DESC")
    elsif params[:status] == "迷子"
      @pets = Pet.where(status: "迷子").order(created_at: "DESC")
    else
      @pets = Pet.all.order(created_at: "DESC")
    end
  end

  def new
    if user_signed_in?
      @pet = Pet.new
    else
      flash[:info] = "ユーザー登録が必要です"
      redirect_to new_user_registration_path
    end
  end
  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    @pet.area = params[:pet][:prefecture].to_s + " " + params[:pet][:place].to_s
    if @pet.save
      flash[:success] = "保存しました"
      redirect_to pets_path
    else
      render :new
    end
  end

  def edit
  end

  def show
    @pet = Pet.find(params[:id])
    @user = @pet.user
    if user_signed_in?
      @currentUserEntry = Entry.where(user_id: current_user.id)
      @userEntry = Entry.where(user_id: @user.id)
      unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        unless @isRoom
          @room = Room.new
          @entry = Entry.new
        end
      end
    end


  end

  private
  def pet_params
    params.require(:pet).permit(:name, :kind, :gender, :feature, :photo, :status, :find_day, :lost_day, :wanted, :image, :image_cache, :latitude, :longitude, :prefecture, :place, :area)
  end
end
