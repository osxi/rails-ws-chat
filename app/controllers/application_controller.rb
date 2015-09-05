class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def ws_host
    port = request.port
    host = request.host
    render json: {host: host, port: port}
  end
end
