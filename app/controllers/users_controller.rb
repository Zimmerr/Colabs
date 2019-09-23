class UsersController < ApplicationController

	before_action :set_user, only: [:edit, :update]

    def new
      redirect_to index_path if user_signed_in?
      @user = User.new
    end
	
	def edit

	end

    #TODO - Teste unitario
    def create
	     @user = User.new(user_params)
	     if @user.save
         	flash[:success] = 'Usuário cadastrado com sucesso!'
		     redirect_to root_path
	     else
		     flash[:notice] = "Oops! Houve um erro. Verifique seus dados novamente."
		     redirect_to '/cadastrar_usuario'
	     end
	end
	
	#TODO - Teste unitario
	#TODO - Dar um jeito de deixar o usuario alterar seus dados sem mudar senha, atualmente ele precisa inserir uma nova de ao menos 6 caracteres
	def update
		if @user.update user_params
			flash[:success] = 'Usuário atualizado com sucesso!'
			redirect_to editar_usuario_url
		else
			flash[:notice] = "Oops! Houve um erro. Verifique seus dados novamente."
			#redirect_to '/cadastrar_usuario'
		end
   end

    #reutilizar nas outras acoes CRUD
    private
	#impedir transmissao de parametros maliciosos - strong params
    	def user_params
		    params.require(:user).permit(:nome, :email, :password, :password_confirmation)
		end
		
		def set_user
			if params[:id]
				@user = User.find(params[:id])
			else 
				@user = current_user
			end
		end

end
