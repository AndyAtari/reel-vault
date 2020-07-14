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
        set_film
        erb :'films/show'
    end

    #edit action(view for form that will update)
    get '/films/:id/edit' do
       set_film
       erb :'films/edit'
    end

    #update action
    patch '/films/:id' do 
        params.delete(:_method)
        set_film
        @film.update(params)
        redirect '/films'
    end

    #delete action
    delete '/films/:id' do
        set_film
        @film.destroy
        redirect '/films'
    end

    def set_film
        @film = current_user.films.find_by_id(params[:id])
    end
end