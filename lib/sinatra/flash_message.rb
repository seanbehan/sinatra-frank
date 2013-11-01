# Simple flash messaging in Sinatra
#
# require 'sinatra/flash_message' 
#
# configure { enable :sessions }
# helpers { def flash; @flash ||= FlashMessage.new(session); end }
# 
# get '/' do
#   flash.message = 'hello world'
# end
#
# <%= flash.message %>
#
class FlashMessage
  def initialize(session)
    @session ||= session
  end

  def message=(message)
    @session[:flash] = message
  end

  def message
    message = @session[:flash]
    @session[:flash] = nil
    message
  end
end
