class SessionsController < ApplicationController


    def login
    end
    def create
        username=params[:username]
        password=params[:password]
        user=User.find_by(username:username.downcase)
        if user && user.authenticate(password)
            session[:user_id]=user.id
            puts user.position
            redirect_to :dashboard
        else
            flash[:notice]="wrong credentials provided"
            redirect_to :login
        end
    end
    def destroy
        session[:user_id]=nil
        redirect_to ''
    end
    def test
        if !helpers.logged_in?
            flash[:notice]="You need to login to view the requested page"
            redirect_to ''
        else
            puts helpers.current_user.position
            @position=helpers.current_user.position
        end
    
        
    end
end
