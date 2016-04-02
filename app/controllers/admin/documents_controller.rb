class Admin::DocumentsController < Admin::BaseController

  before_action :authorize_admin_access?
  before_action :prepare_document, only: [:show, :edit, :update, :destroy]

  def index
    @current_items = Document.order('name asc')
  end

  def show
  end

  def new
    @current_item = Document.new
  end

  def edit
  end

  def create
    @current_item = Document.new(document_params)
    if @current_item.save
      redirect_to admin_documents_path, notice: 'Successfully created document'
    else
      flash.now[:error] = @current_item.errors
      render :new
    end
  end

  def update
    if @current_item.update_attributes(document_params)
      redirect_to admin_documents_path, notice: 'Successfully updated document'
    else
      flash.now[:error] = @current_item.errors
      render :edit
    end
  end

  def destroy
    @current_item.destroy
    redirect_to admin_documents_path
  end

  private

  def prepare_document
    @current_item = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:name)
  end

end
