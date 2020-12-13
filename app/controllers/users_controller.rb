class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to pets_path
      flash[:info] = "権限がありません。"
    end
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)

    @pets = @user.pets

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
