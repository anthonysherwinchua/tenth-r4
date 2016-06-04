class Admin::ApplicantsController < Admin::BaseController
  before_action :authorize_encoder_access?

  before_action :prepare_step, only: [:edit, :update]
  before_action :prepare_form, only: [:edit, :update]

  def index
    @applicants = Applicant.all
  end

  def new
    @form = ApplicantWizardForm::Base.new
  end

  def edit; end

  def create
    @form = ApplicantWizardForm::Base.new

    if @form.save(form_params)
      flash[:notice] = "Created contacts"
      redirect_to edit_admin_applicant_path(@form.current_wizard_step_instance.applicant)
    else
      flash[:error] = "There were errors"
      render :new
    end
  end

  def update
    if @form.save(form_params)
      flash[:notice] = "Updated contacts"
      opts = @form.step_manager.wizard_completed? ? { step: @step } : { step: (@step + 1) }
      redirect_to edit_admin_applicant_path(@applicant, opts)
    else
      flash[:error] = "There were errors"
      render :action => 'edit'
    end
  end

  private

  def prepare_step
    @step = params[:step].to_i
  end

  def prepare_form
    @applicant = Applicant.find(params[:id])
    @form = ApplicantWizardForm::Base.new(applicant: @applicant, step: params[:step])
  end

  def form_params
    params.require(@form.current_wizard_step.attributes_for_strong_params_container)
      .permit(@form.current_wizard_step.attributes_for_strong_params)
  end

end
