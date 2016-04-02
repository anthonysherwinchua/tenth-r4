class Admin::AcademicLevelsController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_academic_level, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = AcademicLevel.order('name asc')
  end

  def show
  end

  def new
    @current_item = AcademicLevel.new
  end

  def edit
  end

  def create
    @current_item = AcademicLevel.new(academic_level_params)
    if @current_item.save
      redirect_to admin_academic_levels_path, notice: 'Successfully created academic level'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(academic_level_params)
      redirect_to admin_academic_levels_path, notice: 'Successfully updated academic level'
    else
      flash.now[:error] = @current_item.errors
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_academic_levels_path
  end

  private

  def prepare_academic_level
    @current_item = AcademicLevel.find(params[:id])
  end

  def academic_level_params
    params.require(:academic_level).permit(:name)
  end

end
