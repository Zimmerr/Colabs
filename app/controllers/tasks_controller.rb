class TasksController < ApplicationController

  before_action :index, except: [:new, :create, :edit, :update, :destroy]

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

  def edit
        @task = Task.find(params[:id])
        @project = Project.find(params[:project_id])
        @lists = @project.lists
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
  end

  def update
    @task = Task.find(params[:id])
    taskid = @task.project_id.to_s
    @rout = '/project_task?project_id=' << taskid
    if @task.update(save_task_params)
        redirect_to @rout
    else
     redirect_to @rout
    end
  end

  def destroy
        @task = Task.find(params[:id])
        taskid = @task.project_id.to_s
        @rout = '/project_task?project_id=' << taskid
		    @task.destroy
		    redirect_to @rout
	end


  #reutilizar nas outras acoes CRUD
  private
    #impedir transmissao de parametros maliciosos - strong params
    def task_params
            params.require(:task).permit(:name, :desc,:project_id,:list_id)
    end

    def save_task_params
			params.require(:task).permit(:name, :desc, :list_id)
		end
end
