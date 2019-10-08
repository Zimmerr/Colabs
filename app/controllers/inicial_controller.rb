class InicialController < ApplicationController

  before_action :require_logged_in_user

  def index
    @projetos = current_user.projects
    puts @projetos
    puts @projetos.length
  end
end
