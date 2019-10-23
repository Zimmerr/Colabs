class TasksController < ApplicationController

  before_action :index, except: [:new, :create]

  def index
        @tasks = Task.all
        @project = Project.find(params[:project_id])
        @lists = @project.lists
        render "index", locals: { project: @project }
  end

  def new
        @project = Project.find(params[:project_id])
        @lists = @project.lists
        @task = Task.new
        @arrayList = Array.new
        @arrayOthers = Array.new
        @lists.each do |list|
          if list.id == params[:list_id].to_i
            object = { "name" => list.name,
                       "desc" => list.desc,
                       "id" => list.id
                     }
            @arrayList.push(object)
          else
            otherObject = { "name" => list.name,
                       "desc" => list.desc,
                       "id" => list.id
                     }
            @arrayOthers.push(otherObject)
          end
        end
        @arrayList += @arrayOthers
        respond_to do |format|
          format.html
          format.js
        end
  end

  def create
        @task = Task.new(task_params)
        taskid = @task.project_id.to_s
        @rout = '/project_task?project_id=' << taskid
        if @task.save
            flash[:success] = 'Task cadastrada!'
            redirect_to @rout
        else
            flash[:notice] = "Houve um erro. Verifique seus dados novamente."
            params[:project_id] = @task.project_id
            redirect_to @rout
       end
  end


  #reutilizar nas outras acoes CRUD
  private
    #impedir transmissao de parametros maliciosos - strong params
    def task_params
            params.require(:task).permit(:name, :desc,:project_id,:list_id)
    end
end
