class WikisController < ApplicationController


  def index
    @public_wikis = Wiki.where(private: false).paginate(page: params[:page], per_page: 10)
    authorize @public_wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(wiki_params)

      if current_user.standard?
        @wiki.update_attribute(:private, false)
      end

    @wiki.users.push(current_user) # Wiki needs to have an initial user/collaboration
    authorize @wiki

     if @wiki.save
       flash[:notice] = "Wiki was saved."
       redirect_to @wiki.users.first
     else
       flash[:error] = "Error. Couuld not save the wiki."
     end

  end

  def edit
    @wiki = Wiki.find(params[:id])
    @users = @wiki.available_users
    authorize @wiki
  end

  def update
     @wiki = Wiki.find(params[:id])
     
     if @wiki.update_attributes(wiki_params)
       flash[:notice] = "Updated the wiki."
       redirect_to @wiki
     else
       flash[:error] = "Could not update wiki. Please try again."
       render :edit
     end
   end

   def destroy
     @wiki = Wiki.find(params[:id])
 
     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" has been deleted."
       redirect_to @wiki.users.first
     else
       flash[:error] = "Could not delete the wiki."
       render :show
     end
   end


  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private, :collaborations)
  end

end
