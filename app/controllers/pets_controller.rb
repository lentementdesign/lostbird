class PetsController < ApplicationController
  PER = 9
  def index
    pet_page = Pet.page(params[:page]).includes(:user).per(PER).order(created_at: "DESC")
    if params[:keyword].present? && params[:prefecture] != "都道府県を選択" && params[:prefecture].present? && params[:status] == "迷子"
      @pets = pet_page.kind_like(params[:keyword]).prefecture_match(params[:prefecture]).where(status: "迷子")
    elsif params[:keyword].present? && params[:prefecture] != "都道府県を選択" && params[:prefecture].present? && params[:status] == "保護"
      @pets = pet_page.kind_like(params[:keyword]).prefecture_match(params[:prefecture]).where(status: "保護")
    elsif params[:keyword].present? && params[:prefecture] != "都道府県を選択" && params[:prefecture].present? && params[:status] == "すべてのステータス"
      @pets = pet_page.kind_like(params[:keyword]).prefecture_match(params[:prefecture])
    elsif params[:keyword].present? && params[:prefecture] != "都道府県を選択" && params[:status] == "迷子"
      @pets = pet_page.kind_like(params[:keyword]).where(status: "迷子")
    elsif params[:keyword].present? && params[:prefecture] != "都道府県を選択" && params[:status] == "保護"
      @pets = pet_page.kind_like(params[:keyword]).where(status: "保護")
    elsif params[:keyword].present? && params[:prefecture] != "都道府県を選択" && params[:status] == "すべてのステータス"
      @pets = pet_page.kind_like(params[:keyword]).order(created_at: "DESC")
    elsif params[:prefecture].present? && params[:prefecture] != "都道府県を選択" && params[:status] == "迷子"
      @pets = pet_page.prefecture_match(params[:prefecture]).where(status: "迷子")
    elsif params[:prefecture].present? && params[:prefecture] != "都道府県を選択" && params[:status] == "保護"
      @pets = pet_page.prefecture_match(params[:prefecture]).where(status: "保護")
    elsif params[:prefecture].present? && params[:prefecture] != "都道府県を選択" && params[:status] == "すべてのステータス"
      @pets = pet_page.prefecture_match(params[:prefecture])
    elsif params[:status] == "保護"
      @pets = pet_page.where(status: "保護")
    elsif params[:status] == "迷子"
      @pets = pet_page.where(status: "迷子")
    else
      @pets = pet_page.all.per(PER)
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
    @pet = Pet.find(params[:id])
  end
  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      flash[:success] = "ペット情報を編集しました！"
      redirect_to pet_path(@pet.id)
    else
      render :edit
    end
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
