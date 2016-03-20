class Admin::AcademicDegreesController < Admin::BaseController

  before_action :prepare_academic_level
  before_action :prepare_academic_degree, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = @current_item_parent.academic_degrees.order('name asc')
  end

  def show
  end

  def new
    @current_item = @current_item_parent.academic_degrees.new
  end

  def edit
  end

  def create
    @current_item = @current_item_parent.academic_degrees.new(academic_degree_params)
    if @current_item.save
      redirect_to [:admin, @current_item_parent, controller_name.to_sym], notice: 'Successfully created academic degree'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(academic_degree_params)
      redirect_to [:admin, @current_item_parent, controller_name.to_sym], notice: 'Successfully updated academic degree'
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

  def prepare_academic_level
    @current_item_parent = AcademicLevel.find(params[:academic_level_id])
  end

  def prepare_academic_degree
    @current_item = @current_item_parent.academic_degrees.find(params[:id])
  end

  def academic_degree_params
    params.require(:academic_degree).permit(:name, :academic_level_id)
  end

end
