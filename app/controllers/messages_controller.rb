class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_user.id))
      redirect_to "/rooms/#{@message.room_id}"
    else
      redirect_back(fallback_location: root_path)
    end
  end
  def edit
    @message = Message.find(params[:id])
  end
  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      flash[:success] = "メッセージを編集しました！"
      redirect_to room_path(id:@message.room_id)
    else
      render :edit
    end
  end
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:success] = "メッセージを削除しました！"
    redirect_to room_path(id:@message.room_id)
  end
  private
  def message_params
    params.require(:message).permit(:content)
  end
end
