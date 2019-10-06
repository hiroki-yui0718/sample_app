class ApplicationController < ActionController::Base
  include SessionsHelper #コントローラは最小限
  def login_required
    redirect_to login_path unless current_user
  end
end
