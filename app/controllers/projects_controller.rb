class ProjectsController < ApplicationController
	def index
        if (params[:search_term])
            @projects = Project.search(search_term)
        else
            @projects = Project.first
        end
	end

	def destroy
        @project = Project.find(params[:id])
		@project.destroy
		redirect_to '/meus_projetos'
	end

	def edit
        @project = Project.find(params[:id])
	end

	def show
        @project = Project.find(project_params[:id])
	end

	def new
	   @project = Project.new
       respond_to do |format|
           format.js
       end
	end

    def update
        @project = Project.find(params[:id])
        if @project.update(save_project_params)
            redirect_to '/meus_projetos'
        else
		     redirect_to '/meus_projetos'
        end
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
            params.require(:project).permit(:name, :desc, :id)
		end
		def save_project_params
			params.require(:project).permit(:name, :desc)
		end
end
