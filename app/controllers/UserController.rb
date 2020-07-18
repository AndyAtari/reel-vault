class UserController < ApplicationController

    get '/login' do
        
        erb :"users/login"
    end

    post '/login' do
        session[:email] = params[:email]
        redirect "/films"
    end

    get '/logout' do 
        session.clear
    end
    
end