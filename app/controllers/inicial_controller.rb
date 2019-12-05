class InicialController < ApplicationController

  before_action :require_logged_in_user

  def index
      @projects = Project.all
  end
end
