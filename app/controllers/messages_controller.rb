class MessagesController < ApplicationController

  expose(:messages_in_conversations) { current_user.messages.conversations }

  def index
  end

  def show
  end

  def new
  end
end