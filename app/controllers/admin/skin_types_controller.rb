class Admin::SkinTypesController < Admin::BaseController

  before_action :prepare_skin_type, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = SkinType.order('name asc')
  end

  def show
  end

  def new
    @current_item = SkinType.new
  end

  def edit
  end

  def create
    @current_item = SkinType.new(skin_type_params)
    if @current_item.save
      redirect_to admin_skin_types_path, notice: 'Successfully created skin type'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(skin_type_params)
      redirect_to admin_skin_types_path, notice: 'Successfully updated skin type'
    else
      flash.now[:error] = @current_item.errors
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_skin_types_path
  end

  private

  def prepare_skin_type
    @current_item = SkinType.find(params[:id])
  end

  def skin_type_params
    params.require(:skin_type).permit(:name)
  end

end
