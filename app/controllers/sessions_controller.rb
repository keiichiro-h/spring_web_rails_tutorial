class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
          if params[:session][:remember_me] == '1'
            remember(user)
          else
            forget(user)
          end
          redirect_back_or user
      else
        message = "アカウントが有効化されていません"
        message += "Eメールを確認し、アカウントを有効化してください。"
        flach[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = '正しくないメールアドレスとパスワードの組み合わせです'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
