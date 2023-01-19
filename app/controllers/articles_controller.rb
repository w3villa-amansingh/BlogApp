class ArticlesController < ApplicationController
before_action :find_by,only: %i[show edit destroy update ]
before_action :require_user, except: [:show, :index]

  def index
   
    @articles =current_user.articles .paginate(page: params[:page], per_page: 3)

  end

  
  def show
  end

  def new
    @article=Article.new
  end
  
  def edit

  end
  
  def create
    @article=Article.new(article_params)
    @article.user= current_user
   if @article.save
    flash[:notice]= "Article  successfully created"
    redirect_to @article
   else
    render 'new'
   end
  end

  def update
    
    if @article.update(article_params)
      flash[:notice] = "update successfully"
      redirect_to @article
    else
      render 'edit'
      
    end
  end
    
 
  
    def destroy
      @article.destroy
      redirect_to @article
    end
          def require_user
              if !logged_in?
                flash[:alert] = "You must be logged in to perform that action"
                redirect_to login_path
              end
          end   
          
              private
                  def article_params
                  params.require(:article).permit(:title,:description)
                  end

    def find_by
    @article = Article.find(params[:id])
end

end
