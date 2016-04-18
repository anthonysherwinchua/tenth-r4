class Admin::RequirementsController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_job_opening
  before_action :prepare_requirement, only: [:show, :edit, :update, :destroy]

  def index
    current_items = @current_item_parent.requirements
    @current_items = RequirementDecorator.wrap(current_items)
  end

  def show
    @current_item = RequirementDecorator.new(@current_item)
  end

  def new
    @current_item = @current_item_parent.requirements.new
  end

  def edit
  end

  def create
    @current_item = @current_item_parent.requirements.new(requirement_params)
    if @current_item.save
      redirect_to [:admin, @current_item_parent, controller_name.to_sym], notice: 'Successfully created requirement'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(requirement_params)
      redirect_to [:admin, @current_item_parent, controller_name.to_sym], notice: 'Successfully updated requirement'
    else
      flash.now[:error] = @current_item.errors
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to [:admin, @current_item_parent, controller_name.to_sym]
  end

  private

  def prepare_job_opening
    current_item_parent = JobOpening.find(params[:job_opening_id])
    @current_item_parent = JobOpeningDecorator.new(current_item_parent)
  end

  def prepare_requirement
    @current_item = @current_item_parent.requirements.find(params[:id])
  end

  def requirement_params
    params.require(:requirement).permit(:document_id, :job_opening_id, :enabled)
  end
  
end
