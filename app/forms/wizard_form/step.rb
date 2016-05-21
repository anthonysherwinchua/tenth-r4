class WizardForm::Step < BaseForm

  def self.inherited(child)
    child.instance_variable_set("@has_many_attributes", [])
    child.instance_variable_set("@has_one_attributes", [])
    child.instance_variable_set("@attributes", [])
  end

  def self.main_model(name, klass, opts={})
    raise "Main model already defined" unless @main_model.blank?
    @main_model = name
    attr_reader name

    @attributes = prepare_attributes(klass, opts)
    attr_accessor(*@attributes)

    delegate *@attributes, to: name, prefix: false, allow_nil: false
    delegate :errors, to: name, prefix: false, allow_nil: false
  end

  def self.strong_params
    @attributes + @has_one_attributes + @has_many_attributes
  end

  def self.has_many(name, klass, attrs={})
    attr_reader name

    new_attrs = prepare_attributes(klass, attrs)
    @has_many_attributes += [{ :"#{name}_attributes" => new_attrs }]

    delegate name, to: @main_model, prefix: false, allow_nil: true
    delegate "#{name}_attributes=", to: @main_model, prefix: false, allow_nil: true

    define_method "#{name}_attributes=" do |params|
      instance_variable_get("@#{name}").each_with_index do |a, i|
        a.attributes = params["#{i}"]
      end
    end
  end

  def self.has_one(name, klass, attrs={})
    attr_reader name

    @has_one_attributes ||= []
    new_attrs = prepare_attributes(klass, attrs)
    @has_one_attributes += [{ :"#{name}" => new_attrs }]
    attr_accessor(*new_attrs)

    delegate *new_attrs, to: name, prefix: false, allow_nil: true
  end

  def self.partial_name
    klass_name = self.to_s.split("::").last
    klass_name = klass_name.gsub(/(.*)(Step)(.*)/, '\1\3')
    "form_#{klass_name.underscore}"
  end

  def self.title
    # Option: override this if you want to have a custom title for the step
    # defaults to class name without suffix 'step'. e.g. FirstOfManyStep would be "First Of Many"
    klass_name = self.to_s.split("::").last
    klass_name = klass_name.gsub(/(.*)(Step)(.*)/, '\1\3')
    klass_name.underscore.humanize.titleize
  end

  def self.description
    # Optional: override this if you want a description for the step
  end

  private

  def self.prepare_attributes(klass, opts={})
    if opts.has_key?(:only)
      [opts[:only]].flatten.map(&:to_s)
    elsif opts.has_key?(:except)
      except_vars = [attrs[:except]].flatten.map(&:to_s)
      klass.column_names - except_vars
    else
      klass.column_names
    end
  end

end
