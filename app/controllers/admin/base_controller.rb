class Admin::BaseController < ApplicationController

  include Pundit

  layout 'admin'

  before_action :authenticate_user!

  def dashboard
  end

  private

  def authorize_admin_access?
    authorize :'admin', :access?
  end

end
