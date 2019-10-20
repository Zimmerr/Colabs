class ProjectUsersController < ApplicationController



    def edit
        @project = Project.find(params[:id])
        @membros = User.joins(:projects).where(projects: {id: params[:id]})
    end
    
    def set_project
        project = Project.find(params[:id])
    end

    def new
        @tmembros = User.all
        @pu = ProjectUser.new
    end

    def inserir
        @user = User.find(params[:id])
        r = ProjectUser.create(:user_id=> @user, :project_id=> @project)
    end

    def create
        puts '-----------------------------------------------------------'
        @user = User.find(params[:id])
        @pu = ProjectUser.create(:user_id => params[:id], :project_id => 4)
        #redirect_to index_path
    end

end
