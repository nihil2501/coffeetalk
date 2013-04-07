class PasswordsController < Clearance::PasswordsController
  def create
    if user = find_user_for_create
      user.forgot_password!
      deliver_email(user)
    end

    flash_success_after_password_create
    redirect_back_or url_after_create
  end

  private

  def flash_success_after_password_create
    flash[:success] = translate(
      :password_reset,
      :scope => [:clearance, :controllers, :passwords],
      :default => t('flashes.success_after_password_create')
    )
  end

  def flash_failure_when_forbidden
    flash.now[:error] = translate(:forbidden,
      :scope => [:clearance, :controllers, :passwords],
      :default => t('flashes.failure_when_forbidden'))
  end

  def flash_failure_after_update
    flash.now[:error] = translate(:blank_password,
      :scope => [:clearance, :controllers, :passwords],
      :default => t('flashes.failure_after_update'))
  end
end