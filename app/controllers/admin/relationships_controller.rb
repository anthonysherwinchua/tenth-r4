class Admin::RelationshipsController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_relationship, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = Relationship.order('name asc')
  end

  def show
  end

  def new
    @current_item = Relationship.new
  end

  def edit
  end

  def create
    @current_item = Relationship.new(relationship_params)
    if @current_item.save
      redirect_to admin_relationships_path, notice: 'Successfully created relationship'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(relationship_params)
      redirect_to admin_relationships_path, notice: 'Successfully updated relationship'
    else
      flash.now[:error] = @current_item.errors
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_relationships_path
  end

  private

  def prepare_relationship
    @current_item = Relationship.find(params[:id])
  end

  def relationship_params
    params.require(:relationship).permit(:name)
  end

end
