if Rails.env.test?
  unless EventMachine.reactor_running? && EventMachine.reactor_thread.alive?
    Thread.new { EventMachine.run }
  end
end

# https://github.com/depili/websocket-rails/commit/5b010567bc13ba759c6945709d84517762b60b6a
# module WebsocketRails
#   Dispatcher.class_eval do
#     def execute(actions)
#       actions.map do |action|
#         unless Rails.env.test?
#           EM.next_tick { action.resume }
#         else
#           # In tests we need to process the actions immediately.
#           action.resume
#         end
#       end
#     end
#   end
# end
