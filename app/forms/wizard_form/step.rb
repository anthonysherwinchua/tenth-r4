class WizardForm::Step

  include ActiveModel::Model

  def self.main_model(name, klass, attrs={})
    attr_reader name

    @attributes = prepare_attributes(klass, attrs)
    attr_accessor(*@attributes)

    delegate *@attributes, to: name, prefix: false, allow_nil: false
    delegate :errors, to: name, prefix: false, allow_nil: false
  end

  def self.strong_params
    @attributes + @has_one_attributes
  end

  def self.has_one(name, klass, attrs={})
    attr_reader name

    @has_one_attributes ||= []
    new_attrs = prepare_attributes(klass, attrs)
    @has_one_attributes += [{ :"#{name}" => new_attrs }]
    attr_accessor(*new_attrs)

    delegate *new_attrs, to: name, prefix: false, allow_nil: true
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

  private

  def self.prepare_attributes(klass, attrs={})
    if attrs.has_key?(:only)
      [attrs[:only]].flatten.map(&:to_s)
    elsif attrs.has_key?(:except)
      except_vars = [attrs[:except]].flatten.map(&:to_s)
      klass.column_names - except_vars
    else
      klass.column_names
    end
  end

end
