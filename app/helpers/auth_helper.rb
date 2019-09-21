module AuthHelper # aqui a gente gerencia as funções de login e logout; checar se está logado

  def sign_in(user)
    session[:user_id] = user.id # aqui a gente seta o usuário como logado
  end

  def sign_out
    session.delete(:user_id)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    !current_user.nil?
  end


end
