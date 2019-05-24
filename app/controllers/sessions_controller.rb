class SessionsController < ApplicationController
  def create
    session[:user_id] = authenticate_user(request.env['omniauth.auth']).id
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def authenticate_user(auth)
    user = User.find_or_create_by(uid: auth[:uid])
    user.update!(
      name: auth[:info][:name],
      nickname: auth[:info][:nickname],
      description: auth[:info][:description],
      image_url: auth[:info][:image]
    )
    user
  end
end
