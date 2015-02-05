class SendMessage
  def initialize(from, to, body, reply = nil)
    @from = from    # User
    @to = to        # User
    @body = body    # text
    if reply
      @reply = ActsAsMessageable::Message.find(reply)  # message_to_reply_to
    else
      @reply = reply
    end
  end

  def send_message
    if @reply
      @from.reply_to(@reply, { body: @body } )
    else
      @from.send_message(@to, { body: @body } )
    end
  end
end