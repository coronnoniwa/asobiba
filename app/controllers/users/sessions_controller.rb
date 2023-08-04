class Users::SessionsController < Devise::SessionsController
  def create
    @user = User.new(sign_in_params)

    if params[:user][:email].blank? || params[:user][:password].blank?
      flash.now[:alert] = ''
      if params[:user][:email].blank?
        flash.now[:alert] += 'メールアドレスを入力してください。<br>'
      elsif params[:user][:email].exclude?("@")
        flash.now[:alert] += 'メールアドレスに「@」を挿入してください。<br>'
      elsif params[:user][:email].exclude?("/^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/")
        flash.now[:alert] += 'メールアドレスは不正な値です。<br>'
      end
      if params[:user][:password].blank?
        flash.now[:alert] += 'パスワードを入力してください。'
      end

      render :new and return
    end

    self.resource = warden.authenticate!(auth_options)
    if resource
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      flash.now[:alert] = 'メールアドレスまたはパスワードが違います'
      render :new
    end
  end
end