class CollaboratorsController < ApplicationController
  before_action :set_wiki_id



    def new
      @collaborator = @wiki.Collaborator.new
    end

    def show
      @collaborator = Collaborator.find(params[:id])
    end

    def create
      @collaborator = @wiki.Collaborator.new(collaborator_params)

      if @collaborator.save
        flash[:notice] = "Collaborator was saved."
        redirect_to @wiki
      else
        flash[:notice] = "Error. Could not add the collaborator."
        redirect_to @wiki
    end

    def destroy
      @collaborator = Collaborator.find(params[:id])
      if @collaborator.destroy
        flash[:notice] = "#{@collaborator.user.email} was removed."
        redirect_to @wiki
      else
        flash[:notice] = "Error. Could not remove the collaborator."
        redirect_to @wiki
      end
    end

  private

  def set_wiki_id
    @wiki = Wiki.find(params[:wiki_id])
  end
end
