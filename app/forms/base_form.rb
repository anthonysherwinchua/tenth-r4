class BaseForm

  include ActiveModel::Model

  include BaseForms::MainModel
  include BaseForms::HasOne
  include BaseForms::HasMany

  def self.inherited(base)
    @@main_model_attributes ||= []
    @@has_one_attributes ||= []
    @@has_many_attributes ||= []
  end

  def self.attributes_for_strong_params_container
    to_s.underscore.gsub('/', '_').to_sym
  end

  def self.attributes_for_strong_params
    @@main_model_attributes + @@has_one_attributes + @@has_many_attributes
  end

  def self.partial_name
    "form_#{name.demodulize.underscore.chomp('_step')}"
  end

  def self.prepare_attributes(klass, opts={})
    if opts.has_key?(:only)
      [opts[:only]].flatten.map(&:to_s)
    elsif opts.has_key?(:except)
      except_vars = [attrs[:except]].flatten.map(&:to_s)
      klass.column_names - except_vars
    else
      klass.column_names - ["updated_at", "created_at", "#{class_variable_get("@@main_model")}_id"]
    end
  end

  def save(params)
    params.each do |attr, value|
      self.public_send("#{attr}=", value)
    end if params
  end

  def valid?(params)
    save(params)
    main_model_valid? &&
      has_one_models_valid? &&
      has_many_models_valid? &&
      super
  end

  private

  def main_model_valid?
    instance_variable_get("@#{@@main_model}").public_send('valid?')
  end

  def has_one_models_valid?
    @@has_one_models.each do |model|
      m = instance_variable_get("@#{model}")
      m.blank? ? false : m.public_send('valid?')
    end
  end

  def has_many_models_valid?
    @@has_many_models.each do |model|
      instance_variable_get("@#{model}")&.map(&:valid?)
    end
  end

end
