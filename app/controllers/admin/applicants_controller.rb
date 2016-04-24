class Admin::ApplicantsController < Admin::BaseController
  before_action :authorize_encoder_access?

  before_filter :prepare_applicant, only: [:show, :new, :edit, :create, :update]
  before_filter :prepare_step, only: [:show, :new, :edit, :create, :update]
  before_filter :prepare_wizard, only: [:show, :new, :edit, :create, :update]

  def index
    @current_items = Applicant.all
  end

  def new; end

  def edit; end

  def create
    if @wizard_form.save(params)
      redirect_to edit_admin_applicant_path(applicant: @wizard_form.applicant, step: @wizard_form.step_manager.next_step)
    else
      flash[:error] = @wizard_form.errors.full_messages
    end
  end

  def update
    if @wizard_form.save(params)
      redirect_to edit_admin_applicant_path(applicant: @wizard_form.applicant, step: @wizard_form.step_manager.next_step)
    else
      flash[:error] = @wizard_form.errors.full_messages
    end
  end

  private

  def prepare_applicant
    @applicant = Applicant.new
  end

  def prepare_step
    params[:step] ||= 1
  end

  def prepare_wizard
    @wizard_form = ApplicantWizardForm::BaseForm.new(@applicant, params[:step])
  end

  def applicant_params
    params.require(:applicant).permit(@wizard_form.current_wizard_step.strong_params)
  end
end
