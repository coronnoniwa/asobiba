class Users::SessionsController < Devise::SessionsController
  def create
    if params[:user][:email].blank? || params[:user][:password].blank?
      flash[:alert] = ''
      if params[:user][:email].blank?
        flash[:alert] += 'メールアドレスを入力してください。<br>'
      end

      if params[:user][:password].blank?
        flash[:alert] += 'パスワードを入力してください。'
      end

      redirect_to new_user_session_path and return
    end

    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  rescue
    flash[:alert] = 'メールアドレスまたはパスワードが違います'
    redirect_to new_user_session_path
  end
end
