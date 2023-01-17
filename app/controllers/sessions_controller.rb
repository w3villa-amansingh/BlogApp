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
    
end