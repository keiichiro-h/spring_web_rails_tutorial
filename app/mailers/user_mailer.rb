class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "アカウントの有効化(Spring)"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "パスワードの再設定(Spring)"
  end
end
