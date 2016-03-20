class Admin::ZodiacsController < Admin::BaseController

  before_action :prepare_zodiac, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = Zodiac.order('name asc')
  end

  def show
  end

  def new
    @current_item = Zodiac.new
  end

  def edit
  end

  def create
    @current_item = Zodiac.new(zodiac_params)
    if @current_item.save
      redirect_to admin_zodiacs_path, notice: 'Successfully created zodiac'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(zodiac_params)
      redirect_to admin_zodiacs_path, notice: 'Successfully updated zodiac'
    else
      flash.now[:error] = @current_item.errors
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_zodiacs_path
  end

  private

  def prepare_zodiac
    @current_item = Zodiac.find(params[:id])
  end

  def zodiac_params
    params.require(:zodiac).permit(:name)
  end

end
