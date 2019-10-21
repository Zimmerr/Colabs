class ProjectUsersController < ApplicationController

    '''
    def edit
        @project = Project.find(params[:id])
        session[:projectid] = @project.id
        @membros = User.joins(:projects).where(projects: {id: params[:id]})
    end
    '''
    def edit
        session[:projectid] = params[:id]
        @membros = User.joins(:projects).where(projects: {id: params[:id]})
    end
    '''
    def set_project
        @project = Project.find(params[:id])
        session[:projectid] = @project.id
        puts /////////////////////////set_project//////////////////////////////////////////
        puts session[:projectid]
    end
    '''

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
        @pu = ProjectUser.create(:user_id => params[:id], :project_id => session[:projectid])
        redirect_to new_project_user_path(session[:projectid])
    end

    def remove
        ProjectUser.where(:user_id => params[:id], :project_id => session[:projectid]).first.destroy
        redirect_to edit_project_user_path(session[:projectid])
    end
end