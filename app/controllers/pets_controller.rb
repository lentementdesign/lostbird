class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end
  def create
    @pet = Pet.new(pet_params)
    @pet.user_id = current_user.id
    if @pet.save
      redirect_to pets_path, notice: "保存しました"
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
    params.require(:pet).permit(:name, :kind, :gender, :feature, :photo, :lost, :find_day, :lost_day, :wanted, :image, :image_cache, :address, :latitude, :longitude)
  end
end
