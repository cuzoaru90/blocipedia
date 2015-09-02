class UsersController < ApplicationController

  

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
    @wikis = @user.wikis.paginate(page: params[:page], per_page: 10)
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User account downgraded"
      publicize_wikis
      redirect_to welcome_index_path
    else
      flash[:error] = "Invalid user info"
      redirect_to welcome_index_path
    end
  end
 
   private
 
   def user_params
     params.require(:user).permit(:name, :email, :role)
   end

   def publicize_wikis
     current_user.wikis.each do |wiki|
      wiki.update_attribute(:private, false)
     end
   end

end
