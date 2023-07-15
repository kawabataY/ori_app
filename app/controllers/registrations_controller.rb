class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(_resource)
    new_room_path # 登録完了後にリダイレクトするパスを指定します
  end
end
