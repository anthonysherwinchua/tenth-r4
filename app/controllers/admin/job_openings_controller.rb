class Admin::JobOpeningsController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_job_opening, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = JobOpening.order('country_id asc')
  end

  def show
  end

  def new
    @current_item = JobOpening.new
  end

  def edit
  end

  def create
    @current_item = JobOpening.new(job_opening_params)
    if @current_item.save
      redirect_to admin_job_openings_path, notice: 'Successfully created job opening'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(job_opening_params)
      redirect_to admin_job_openings_path, notice: 'Successfully updated job opening'
    else
      flash.now[:error] = @current_item.errors
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_job_openings_path
  end

  private

  def prepare_job_opening
    @current_item = JobOpening.find(params[:id])
  end

  def job_opening_params
    params.require(:job_opening).permit(:country_id, :occupation_id, :enabled)
  end

end
