class ListsController < ApplicationController

  before_action :require_logged_in_user

    def index
	     @project = Project.find(params[:project_id])
	     @lists = @project.lists
	     @list = List.new
	     @list.project_id = @project.id
	end
	
	def edit
		@project = Project.find(params[:project_id])
		@lists = @project.lists
		@list = List.find(params[:list_id])
		@list.project_id = @project.id
		render 'index'
		
	end

	def update
		@list = List.find(params[:list_id])
	     if @list.update(list_params)
         	flash[:success] = 'Lista atualizada com sucesso!'
		     redirect_to listas_projeto_url(:project_id => @list.project_id)
	     else
		     flash[:notice] = "Lista não foi atualizada com sucesso. Preencha os campos corretamente."
		     redirect_to edit_list_url(:list_id => @list.id, :project_id => @list.project_id)
	     end
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

	def destroy
		list = List.find(params[:id])
		if list.isDeletable
			list.destroy
			flash[:success] = 'Lista deletada com sucesso!'
			redirect_to listas_projeto_url(:project_id => list.project_id)
		else
			flash[:notice] = "Lista não pode ser deletada pois contém atividades!"
			redirect_to listas_projeto_url(:project_id => list.project_id)
		end
	end

	private
    	def list_params
		    params.require(:list).permit(:name, :desc)
        end
end
