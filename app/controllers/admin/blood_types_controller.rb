class Admin::BloodTypesController < Admin::BaseController

  before_action :prepare_blood_type, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = BloodType.order('name asc')
  end

  def show
  end

  def new
    @current_item = BloodType.new
  end

  def edit
  end

  def create
    @current_item = BloodType.new(blood_type_params)
    if @current_item.save
      redirect_to admin_blood_types_path, notice: 'Successfully created blood type'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(blood_type_params)
      redirect_to admin_blood_types_path, notice: 'Successfully updated blood type'
    else
      flash.now[:error] = @current_item.errors
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_blood_types_path
  end

  private

  def prepare_blood_type
    @current_item = BloodType.find(params[:id])
  end

  def blood_type_params
    params.require(:blood_type).permit(:name)
  end

end
