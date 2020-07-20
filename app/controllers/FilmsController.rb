class FilmsController < ApplicationController
    #index action
    get '/films' do
        if logged_in?
            @films = current_user.films.all 
            erb :'films/index'
        else
            redirect "/login"
        end
    end

    #new action(view for form that will create)
    get '/films/new' do 
        if !logged_in?  
            redirect "/login"
        else
        erb :'films/new'
        end
    end

    #create action
    post '/films' do
        film = current_user.films.build(params) 
        film.save 
        redirect "films/#{film.id}"
    end

    #show action
    get '/films/:id' do
        @film = Film.find_by_id(params[:id])
        erb :'films/show'
    end

    #edit action(view for form that will update)
    get '/films/:id/edit' do
        if logged_in?
            if set_film
            erb :'films/edit'
        else  
            redirect '/films'
        end
        else
        redirect '/login'
        end
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

    
end