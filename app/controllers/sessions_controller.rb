class SessionsController < ApplicationController
    
    def new
        
    end
    
     def create
        user=User.find_by(email_id: params[:session][:email_id].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id]= user.id
            flash[:notice]="Logged in successfully"
            
          redirect_to articles_path
        else
            flash.now[:alert]="Invalid  details"
            render 'new'
        end
     end
     
    def destroy
        session[:user_id]= nil
        flash[:notice]="Logged out"
        redirect_to root_path
    end
    def omniauth        
        
        # byebug
        # user= User.find_or_create_by(uid: request.env['omniauth.auth'][:uid],provider: request.env['omniauth.auth'][:provider]) do |u|
        #     u.username =request.env['omniauth.auth'][:info][:first_name]
        #     u.email_id =request.env['omniauth.auth'][:info][:email]
        #     u.password = SecureRandom.hex(15)
        # end
        user= User.find_or_create_by(uid: request.env['omniauth.auth'][:uid],provider: request.env['omniauth.auth'][:provider]) do |u|
            u.username =request.env['omniauth.auth'][:info][:first_name]
            u.email_id =request.env['omniauth.auth'][:info][:email]
            u.password = SecureRandom.hex(15)
        end
        if user.valid?
            session[:user_id]= user.id
            redirect_to  articles_path
         else
            redirect_to login_path
        end
    end
    
end