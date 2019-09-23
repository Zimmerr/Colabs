class AuthController < ApplicationController

  def login
      redirect_to index_path if user_signed_in?
  end

  def create # login
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        sign_in(user)
        redirect_to index_path
      else
        flash.now[:danger] = 'Email ou senha incorretos.'
        render 'login'
        #redirect_to root_path
      end
  end

  def destroy
    sign_out
    flash[:warning] = 'Logout realizado com sucesso'
    redirect_to root_path
  end

end
