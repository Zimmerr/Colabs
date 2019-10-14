class ProjectusersController < ApplicationController

    def index
        @usuarios = current_project.users
    end

end
