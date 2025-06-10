class ChatsController < ApplicationController
  def index
    @study = Study.find(params[:study_id])
    @chats = @study.chats.order(:created_at)
    @chat = Chat.new
  end

  def create
    @chats = current_user.chats.includes(:study)
    @chat = Chat.new(chat_params)
    @chat.study = Study.find(params[:study_id])
    @chat.user = current_user
    if @chat.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:chats, partial: "chats/chat", locals: { chat: @chat })
        end
        format.html { redirect_to chats_path }
      end
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:user_question)
  end
end
