class UsersController < ApplicationController

    def new
        @user = User.new
    end

    #TODO - Teste unitario
    #TODO - Fazer um check de consistencia se ja existe aquele usuario(email) no bd
    def create
	@user = User.new(article_params)
	if @user.save
		redirect_to '/'
	else
		flash[:notice] = "Oops, houve um erro. Verifique sua senha e email."
		redirect_to '/cadastrar_usuario'
	end
    end

    #reutilizar nas outras acoes CRUD
    private
	#impedir transmissao de parametros maliciosos - strong params
    	def article_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end
