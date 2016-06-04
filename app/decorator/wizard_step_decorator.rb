class WizardStepDecorator

  def initialize(form)
    @form = form
  end

  def title
    @form.name.demodulize.titleize.chomp(" Step")
  end

  def description
    ''
  end

end
