class PasswordsController < Clearance::PasswordsController
  private

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