class ProjectUsersController < ApplicationController

  before_action :require_logged_in_user

    def edit
        session[:projectid] = params[:id]
        puts 'AAAAAAA'
        usuario_criador = User.joins(:projects).where(projects: {id: params[:id]}).first
        @criador = usuario_criador.nome
        puts 'BBBBBBB'
        @membros_gerenciador = User.joins(:projects).where(projects: {id: params[:id]}).where(project_users: {level: 1})
        @membros_colaborador = User.joins(:projects).where(projects: {id: params[:id]}).where(project_users: {level: 0})
        pu = ProjectUser.where(:user_id => current_user.id, :project_id => session[:projectid]).first
        @level = pu.level
    end

    def new
        @tmembros = User.where('id NOT IN (?)', User.joins(:projects).where(projects: {id: session[:projectid]}).select('id'))
    end

    def create
        @pu = ProjectUser.create(:user_id => params[:id], :project_id => session[:projectid], :level => 0)
        redirect_to new_project_user_path(session[:projectid])
    end

    def remove
        ProjectUser.where(:user_id => params[:id], :project_id => session[:projectid]).first.destroy
        redirect_to edit_project_user_path(session[:projectid])
    end

    def change_level
        pu = ProjectUser.where(:user_id => params[:id], :project_id => session[:projectid]).first
        if pu.level == 1
            pu.update(level: 0)
        else
            pu.update(level: 1)
        end
        redirect_to edit_project_user_path(session[:projectid])
    end
end
