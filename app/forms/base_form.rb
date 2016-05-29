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

end
