class Admin::AcademicDegreesController < Admin::BaseController

  before_action :prepare_academic_degree, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = AcademicDegree.order('degree asc')
  end

  def show
  end

  def new
    @current_item = AcademicDegree.new
  end

  def edit
  end

  def create
    @current_item = AcademicDegree.new(academic_degree_params)
    if @current_item.save
      redirect_to admin_academic_degrees_path, notice: 'Successfully created academic degree'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(academic_degree_params)
      redirect_to admin_academic_degrees_path, notice: 'Successfully updated academic degree'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_academic_degrees_path
  end

  private

  def prepare_academic_degree
    @current_item = AcademicDegree.find(params[:id])
  end

  def academic_degree_params
    params.require(:academic_degree).permit(:degree, :enabled)
  end

end
