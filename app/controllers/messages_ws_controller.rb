class MessagesWsController < WebsocketRails::BaseController
  def create
    new_message = Message.new message

    if new_message.save!
      WebsocketRails[:messages].trigger 'new', new_message
      trigger_success new_message
    else
      trigger_failure new_message
    end
  end
end
