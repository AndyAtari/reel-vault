class FilmsController < ApplicationController
    #index action
    get '/films' do
        not_logged_in?
        @films = current_user.films.all 
        erb :'films/index'
    end

    #new action(view for form that will create)
    get '/films/new' do 
        not_logged_in?
        erb :'films/new'
    end

    #create action
    post '/films' do
        not_logged_in?
        film = current_user.films.build(params) 
        if film.save 
        redirect "films/#{film.id}"
        else  
        @errors = film.errors.full_messages 
        erb :'films/new'
        end
    end

    #show action
    get '/films/:id' do
        if @film = Film.find_by_id(params[:id])
        erb :'films/show'
        else  
        redirect '/'
        end
    end

    #edit action(view for form that will update)
    get '/films/:id/edit' do
        not_logged_in?
        if set_film
        erb :'films/edit'
        else  
        redirect '/films'
        end
    end

    #update action
    patch '/films/:id' do 
        params.delete(:_method)
        if set_film
        @film.update(params)
        redirect '/films' 
        end
    end

    #delete action
    delete '/films/:id' do
        if set_film
        @film.destroy
        redirect '/films'
        end
    end

    #search action(show)
    get '/search/results' do
        @films = Film.all 
        if params[:search]
            @films = Film.search(params[:search])
        else
            @films = Film.all 
        end
        erb :'films/results'
    end

    private

    def set_film
        @film = current_user.films.find_by_id(params[:id])
    end
    
end