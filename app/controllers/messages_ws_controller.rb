class MessagesWsController < WebsocketRails::BaseController
  def create
    new_message = Message.new message

    if new_message.save!
      trigger_success new_message
    else
      trigger_failure new_message
    end
  end
end
