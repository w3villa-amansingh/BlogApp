class UsersController < ApplicationController
    before_action :require_user, only: [:edit, :update]
    before_action :find_id, only: [:show, :edit, :update]
    def show
        @user=User.find(params[:id])
        @article = @user.articles
        @users=User.all
    end

    def index
        @users=User.all
        
   
    end

    def new
        @user = User.new
    end

   def edit
           
   end

   def update
        if @user.update(user_params)
            flash[:notice]="your account successfuly update"
            redirect_to users_path
       
        else
            render 'new'
        end
    end

    def create
    
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice]="Welcome #{@user.username} you have suceessfuly Signed up"
            redirect_to articles_path
        else
            render 'new'
        end
    end
    def require_user
        if !logged_in?
          flash[:alert] = "You must be logged in to perform that action"
          redirect_to login_path
        end
    end  
     def find_id
        @user = User.find(params[:id])
     end
     


    private
    def user_params
        params.require(:user).permit(:username,:email_id,:password)
    end
   
    
end