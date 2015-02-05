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
    redirect_to messages_path
  end
end