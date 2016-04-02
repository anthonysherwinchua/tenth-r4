class Admin::ContactTypesController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_contact_type, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = ContactType.order('name asc')
  end

  def show
  end

  def new
    @current_item = ContactType.new
  end

  def edit
  end

  def create
    @current_item = ContactType.new(contact_type_params)
    if @current_item.save
      redirect_to admin_contact_types_path, notice: 'Successfully created contact type'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(contact_type_params)
      redirect_to admin_contact_types_path, notice: 'Successfully updated contact type'
    else
      flash.now[:error] = @current_item.errors
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_contact_types_path
  end

  private

  def prepare_contact_type
    @current_item = ContactType.find(params[:id])
  end

  def contact_type_params
    params.require(:contact_type).permit(:name)
  end

end
