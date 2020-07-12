class FilmsController < ApplicationController
    #index action
    get '/films' do
        @films = current_user.films 
        erb :'films/index'
    end
    #new action(view for form that will create)

    #create action

    #show action

    #edit action(view for form that will update)

    #update action

    #delete action

end