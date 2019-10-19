class InicialController < ApplicationController

  before_action :require_logged_in_user

  def index
      puts current_user.id

    if (params[:search_term])
        @projetos = Project.search(current_user.id, params[:search_term])
    else
        @projetos = current_user.projects
    end
  end
end
