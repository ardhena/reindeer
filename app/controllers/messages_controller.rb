class MessagesController < ApplicationController

  expose_decorated(:messages_in_conversations, decorator: MessageDecorator, collection: true) { current_user.messages.conversations }
  expose_decorated(:conversation, decorator: MessageDecorator, collection: true) { ActsAsMessageable::Message.find(params[:id]).conversation }
  expose_decorated(:conversationist, decorator: UserDecorator) do
    if conversation.first.sent_messageable.id == current_user.id
      conversation.first.received_messageable
    else
      conversation.first.sent_messageable
    end
  end
  expose(:message) { ActsAsMessageable::Message.new }

  def index
  end

  def show
  end

  def new
  end

  def create
    receiver = User.find(message_params[:received_messageable_id])
    sender = SendMessage.new(current_user, receiver, message_params[:body])
    sender.send_message
    redirect_to messages_path
  end

  private
    def message_params
      params.require(:acts_as_messageable_message).permit(:body, :received_messageable_id)
    end
end