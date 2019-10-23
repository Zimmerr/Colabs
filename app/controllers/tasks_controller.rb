class TasksController < ApplicationController

  before_action :index, except: [:new, :create]

  def index
        @tasks = Task.all
        @project = Project.find(params[:project_id])
        render "index", locals: { project: @project }
  end

  def new
        @task = Task.new
        respond_to do |format|
          format.html
          format.js
        end
  end

  def create
        rout = '/project_task?project_id='+params[:project_id]
        @task = Task.new(task_params)
        if @task.save
            flash[:success] = 'Task cadastrada!'
            redirect_to rout
        else
            flash[:notice] = "Houve um erro. Verifique seus dados novamente."
            redirect_to rout
       end
  end


  #reutilizar nas outras acoes CRUD
  private
    #impedir transmissao de parametros maliciosos - strong params
    def task_params
            params.require(:task).permit(:name, :desc,:project_id)
    end
end
