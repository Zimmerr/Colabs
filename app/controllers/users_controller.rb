class UsersController < ApplicationController

    def new
        @user = User.new
    end

    #TODO - Teste unitario
    def create
	     @user = User.new(article_params)
	     if @user.save
         flash[:success] = 'Usuário cadastrado com sucesso!'
		     redirect_to root_path
	     else
		     flash[:notice] = "Oops! Houve um erro. Verifique seus dados novamente."
		     redirect_to '/cadastrar_usuario'
	     end
    end

    #reutilizar nas outras acoes CRUD
    private
	#impedir transmissao de parametros maliciosos - strong params
    	def article_params
		    params.require(:user).permit(:nome, :email, :password, :password_confirmation)
	    end

end
