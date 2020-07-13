class FilmsController < ApplicationController
    #index action
    get '/films' do
        @films = current_user.films 
        erb :'films/index'
    end

    #new action(view for form that will create)
    get '/films/new' do 
        erb :'films/new'
    end

    #create action
    post '/films' do
        film = current_user.films.build(params) 
        film.save 
        redirect "films/#{film.id}"
    end

    #show action
    get '/films/:id' do
        @film = current_user.films.find_by_id(params[:id])
        erb :'films/show'
    end

    #edit action(view for form that will update)

    #update action

    #delete action
    delete '/films/:id' do
        
    end
end