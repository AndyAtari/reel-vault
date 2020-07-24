class UserController < ApplicationController

    get '/signup' do
        currently_logged_in?
        erb :"/users/new"
    end

    post '/signup' do
        @user = User.new(user_name: params[:user_name], email: params[:email], password: params[:password])
        if @user.save
            session[:user_id] = @user.id
            redirect to "/films"
        else
            @errors = @user.errors.full_messages 
            erb :"/users/new"
        end
    end

    get '/login' do
        currently_logged_in?
        erb :"users/login"
    end

    post '/login' do
        @user = User.find_by(user_name: params[:user_name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/films"
        else
            @error = "Sorry! We can not find a username or password match."
            erb :"users/login"
        end
    end

    get '/logout' do 
        if logged_in?
            session.clear
            @message = "You have logged out successfully!"
            erb :"users/login"
        else   
            redirect "/"    
        end    
    end
    
    
end