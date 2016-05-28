module BaseForms::MainModel

  def self.included(base)
    def base.main_model(name, klass)

      @@main_model = name

      attr_accessor @@main_model
      delegate :attributes=, to: @@main_model, prefix: true

      define_method("#{@@main_model}_attributes=") do |attributes|
        instance_variable_get("@#{@@main_model}").assign_attributes(attributes)
      end

    end
  end

end
