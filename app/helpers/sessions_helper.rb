module SessionsHelper # =4
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id]) #クッキーの場合
      # raise
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        session[:user_id] = user.id
        @current_user = user
      end
    end
  end

   # 現在のユーザーをログアウトする
  def log_out
    forget(current_user) #クッキー削除
    session.delete(:user_id)
    @current_user = nil
  end

  def remember(user)
    user.remember # => DB: remember_digest
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.update_attribute(:remember_digest, nil)
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end
