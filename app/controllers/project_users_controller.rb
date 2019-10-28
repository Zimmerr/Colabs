class ProjectUsersController < ApplicationController

    def edit
        session[:projectid] = params[:id]
        @membros = User.joins(:projects).where(projects: {id: params[:id]})
    end

    def new
        @tmembros = User.where('id NOT IN (?)', User.joins(:projects).where(projects: {id: session[:projectid]}).select('id'))
    end

    def create
        @pu = ProjectUser.create(:user_id => params[:id], :project_id => session[:projectid])
        redirect_to new_project_user_path(session[:projectid])
    end

    def remove
        ProjectUser.where(:user_id => params[:id], :project_id => session[:projectid]).first.destroy
        redirect_to edit_project_user_path(session[:projectid])
    end
end