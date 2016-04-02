class Admin::CivilStatusesController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_civil_status, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = CivilStatus.order('name asc')
  end

  def show
  end

  def new
    @current_item = CivilStatus.new
  end

  def edit
  end

  def create
    @current_item = CivilStatus.new(civil_status_params)
    if @current_item.save
      redirect_to admin_civil_statuses_path, notice: 'Successfully created civil status'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(civil_status_params)
      redirect_to admin_civil_statuses_path, notice: 'Successfully updated civil status'
    else
      flash.now[:error] = @current_item.errors
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_civil_statuses_path
  end

  private

  def prepare_civil_status
    @current_item = CivilStatus.find(params[:id])
  end

  def civil_status_params
    params.require(:civil_status).permit(:name, :enabled)
  end

end
