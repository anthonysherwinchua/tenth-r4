module BaseForms::HasOne

  def self.included(base)
    def base.has_one(name, klass)
      @@has_one_attributes ||= []

      @@has_one_models ||= []
      @@has_one_models << name

      attr_accessor name
      delegate :attributes=, to: name, prefix: true

      define_method("#{name}_attributes=") do |attributes|
        instance_variable_get("@#{name}").assign_attributes(attributes)
      end

    end
  end

end
