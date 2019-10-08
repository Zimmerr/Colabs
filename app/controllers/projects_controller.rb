class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def destroy
		@project = Project.find(project_params[:id])
		@project.destroy
		redirect_to '/meus_projetos'
	end

	def new
	   @project = Project.new
	end

	def create
		 @project = Project.new(save_project_params)
		 @project.users << current_user
	     if @project.save
		     redirect_to '/meus_projetos'
	     else
		     redirect_to '/meus_projetos'
	     end
	end

    private
	#impedir transmissao de parametros maliciosos - strong params
		def project_params
			params.permit(:name, :desc, :id)
		end
		def save_project_params
			params.require(:project).permit(:name, :desc)
		end
end
