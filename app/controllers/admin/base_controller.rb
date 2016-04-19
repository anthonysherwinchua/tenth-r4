class Admin::BaseController < ApplicationController

  include Pundit

  layout 'admin'

  before_action :authenticate_user!

  def dashboard
  end

  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  private

  def permission_denied
    flash[:error] = 'You don\'t have the proper permissions to view this page.'
    self.response_body = nil
    redirect_to(request.referrer || root_path)
  end

  def authorize_admin_access?
    authorize :admin, :access?
  end

  def authorize_encoder_access?
    authorize :encoder, :access?
  end

end
