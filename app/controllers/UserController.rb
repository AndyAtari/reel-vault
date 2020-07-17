class UserController < ApplicationController

    get '/login' do
        
        erb :"users/login"
    end

    post '/login' do
        redirect "/films"
    end
    
end