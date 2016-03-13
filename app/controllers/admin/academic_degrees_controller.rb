class Admin::AcademicDegreesController < Admin::BaseController

  before_action :prepare_academic_degree, only: [:show, :edit, :update, :destroy]

  def index
    @academic_degrees = AcademicDegree.order('degree asc')
  end

  def show
  end

  def new
    @academic_degree = AcademicDegree.new
  end

  def edit
  end

  def create
    @academic_degree = AcademicDegree.new(academic_degree_params)
    if @academic_degree.save
      redirect_to admin_academic_degrees_path, notice: 'Successfully created academic degree'
    else
      flash.now[:error] = @academic_degree.errors
      render :new
    end
  end

  def update
    if @academic_degree.update_attributes(academic_degree_params)
      redirect_to admin_academic_degrees_path, notice: 'Successfully updated academic degree'
    else
      flash.now[:error] = @academic_degree.errors
      render :new
    end
  end

  def destroy
    @academic_degree.destroy
    redirect_to admin_academic_degrees_path
  end

  private

  def prepare_academic_degree
    @academic_degree = AcademicDegree.find(params[:id])
  end

  def academic_degree_params
    params.require(:academic_degree).permit(:degree)
  end

end
