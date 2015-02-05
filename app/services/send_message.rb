class SendMessage
  def initialize(from, to, body, reply = nil)
    @from = from    # User
    @to = to        # User
    @body = body    # text
    @reply = reply  # message_to_reply_to
  end

  def send_message
    if @reply
      @from.reply_to(@reply, { body: @body } )
    else
      @from.send_message(@to, { body: @body } )
    end
  end
end