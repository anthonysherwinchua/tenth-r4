class Admin::ReligionsController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_religion, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = Religion.order('name asc')
  end

  def show
  end

  def new
    @current_item = Religion.new
  end

  def edit
  end

  def create
    @current_item = Religion.new(religion_params)
    if @current_item.save
      redirect_to admin_religions_path, notice: 'Successfully created religion'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(religion_params)
      redirect_to admin_religions_path, notice: 'Successfully updated religion'
    else
      flash.now[:error] = @current_item.errors
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_religions_path
  end

  private

  def prepare_religion
    @current_item = Religion.find(params[:id])
  end

  def religion_params
    params.require(:religion).permit(:name)
  end

end
