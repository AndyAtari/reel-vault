require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, ENV['SESSION_SECRET']
  end

  get "/" do
    if logged_in?
      redirect "/films"
    else  
    erb :welcome
    end
  end
  
  helpers do 
    
    def current_user
    @current_user ||= User.find_by_id(session[:user_id]) 
    end
  
    def logged_in?
    !!current_user
    end

    def currently_logged_in?
      if logged_in?
        redirect "/films"
      end
    end
    
  end

end
