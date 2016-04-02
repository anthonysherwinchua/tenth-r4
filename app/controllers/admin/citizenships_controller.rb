class Admin::CitizenshipsController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_citizenship, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = Citizenship.order('name asc')
  end

  def show
  end

  def new
    @current_item = Citizenship.new
  end

  def edit
  end

  def create
    @current_item = Citizenship.new(citizenship_params)
    if @current_item.save
      redirect_to admin_citizenships_path, notice: 'Successfully created citizenship'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(citizenship_params)
      redirect_to admin_citizenships_path, notice: 'Successfully updated citizenship'
    else
      flash.now[:error] = @current_item.errors
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_citizenships_path
  end

  private

  def prepare_citizenship
    @current_item = Citizenship.find(params[:id])
  end

  def citizenship_params
    params.require(:citizenship).permit(:name)
  end

end
