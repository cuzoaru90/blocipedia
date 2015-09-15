class CollaboratorsController < ApplicationController

  before_action :set_wiki

  def new
    @collaborator = @wiki.collaborators.new
    authorize @collaborator
  end

  def show
    @collaborator = Collaborator.find(params[:id])
  end

  def create
    @collaborator = @wiki.collaborators.new( collaborator_params )

     if @collaborator.save
       flash[:notice] = "Collaboration was saved."
       redirect_to @wiki
     else
       flash[:error] = "Error. Could not save the collaboration."
       redirect_to @wiki
     end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
       flash[:notice] = " #{@collaborator.user.name} was successfully removed."
       redirect_to @wiki
     else
       flash[:error] = "Error. Could not remove the collaborator."
       redirect_to @wiki
     end
  end

  private

  def set_wiki
    @wiki = Wiki.find(params[:wiki_id]) 
  end 

  def collaborator_params
    params.require(:collaborator).permit(:wiki_id, :user_id)
  end


end
