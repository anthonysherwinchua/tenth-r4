class WizardForm::Step

  include ActiveModel::Model
  include ActiveModel::Validations

  def self.attr_accessor(*vars)
    @attributes ||= []
    @attributes.concat vars
    super(*vars)
  end

  def title
    # Option: override this if you want to have a custom title for the step
    # defaults to class name without suffix 'step'. e.g. FirstOfManyStep would be "First Of Many"
    klass_name = self.class.to_s.split("::").last
    klass_name = klass_name.to_s.gsub(/(.*)(Step)(.*)/, '\1\3')
    klass_name.underscore.humanize.titleize
  end

  def description
    # Optional: override this if you want a description for the step
  end

  def self.strong_params
    @attributes
  end

end
