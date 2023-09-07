class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to notes_path
    else
      redirect_to login_path, notice:  "Etwas ist schiefgelaufen! Passwort und Nutzername überprüfen."
    end
  end

  def destroy
    session.delete(:user_id)
    session[:user_id] = nil
    @user = nil
    redirect_to root_path
  end


end