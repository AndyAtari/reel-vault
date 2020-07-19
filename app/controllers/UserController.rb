class UserController < ApplicationController

    get '/signup' do
        if logged_in?
            redirect "/films"
        else
            erb :"/users/new"
        end
    end

    post '/signup' do
        @user = User.new(user_name: params[:user_name], email: params[:email], password: params[:password])
        if @user.save
            session[:user_id] = @user.id
            redirect to "/films"
        else
            redirect "/signup"
        end
    end

    get '/login' do
        if logged_in?
            redirect to "/films"
        else
        erb :"users/login"
        end
    end

    post '/login' do
        @user = User.find_by(user_name: params[:user_name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/films"
        else
            redirect "/login"
        end
    end

    get '/logout' do 
        session.clear
    end
    
end