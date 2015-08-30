class WikisController < ApplicationController

  def index
    @public_wikis = Wiki.where(private: false)
    #@wikis = Wiki.where(user: current_user)
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
    @wiki.user = current_user
    authorize @wiki

     if @wiki.save
       flash[:notice] = "Wiki was saved."
       redirect_to wikis_path
     else
       flash[:error] = "Error. Couuld not save the wiki."
     end

  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
     @wiki = Wiki.find(params[:id])
     if @wiki.update_attributes(wiki_params)
       flash[:notice] = "Updated the wiki."
       redirect_to @wiki.user
     else
       flash[:error] = "Could not update wiki. Please try again."
       render :edit
     end
   end

   def destroy
     @wiki = Wiki.find(params[:id])
 
     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" has been deleted."
       redirect_to wikis_path
     else
       flash[:error] = "Could not delete the wiki."
       render :show
     end
   end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end

end
