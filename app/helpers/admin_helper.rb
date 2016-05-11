module AdminHelper
  def breadcrumb_name(name)
    name || controller_name.humanize
  end

  def class_for_wizard_step(step)
    if @wizard_form.step_manager.current_step == step
      'selected'
    elsif @wizard_form.step_manager.completed_step >= step
      'done'
    elsif @wizard_form.step_manager.next_step >= step
      'next'
    else
      'disabled'
    end
  end

  def step_link(step)
    if @wizard_form.applicant.persisted?
      edit_admin_applicant_path(step: step)
    else
      "#"
    end
  end

end
