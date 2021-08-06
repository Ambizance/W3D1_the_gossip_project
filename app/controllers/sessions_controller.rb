class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
      # cherche s'il existe un utilisateur en base avec l’e-mail
  user = User.find_by(email: params[:email])
  puts "@@@@@@@@@@@@@@@@@@@"
  puts user
  puts "@@@@@@@@@@@@@@@@@@@"
  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    # redirige où tu veux, avec un flash ou pas
    redirect_to "/gossips"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
