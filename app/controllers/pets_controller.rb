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
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :kind, :gender, :feature, :photo, :lost, :find_place, :find_day, :lost_place, :lost_day, :wanted,:image, :image_cache)
  end
end
