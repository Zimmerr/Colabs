class ListsController < ApplicationController
    def index
	  @project = Project.find(params[:project_id])
	  @lists = @project.lists
	  @list = List.new
	  @list.project_id = @project.id
    end
	
	def create
		@list = List.new(list_params)
		@list.project_id = params[:project_id]
	     if @list.save
         	flash[:success] = 'Lista cadastrada com sucesso!'
		     redirect_to listas_projeto_url(:project_id => @list.project_id)
	     else
		     flash[:notice] = "Oops! Houve um erro. Verifique os dados novamente."
		     redirect_to listas_projeto_url(:project_id => @list.project_id)
	     end
	end
	
	private
    	def list_params
		    params.require(:list).permit(:name, :desc)
        end
end
