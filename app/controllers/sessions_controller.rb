class SessionsController < Clearance::SessionsController
  private

  def flash_failure_after_create
    flash.now[:error] = translate(:bad_email_or_password,
      :scope => [:clearance, :controllers, :sessions],
      :default => t('flashes.failure_after_create', :sign_up_path => sign_up_path).html_safe)
  end
end