module BaseForms::HasMany

  def self.included(base)

    ## REQUIRED BY COCOON ##
    def base.reflect_on_association(association); end

    ## REQUIRED BY COCOON ##
    def base.association(association, klass)
      @@attributes ||= {}
      @@attributes[association] = klass
    end

    def base.has_many(name, klass)
      @@has_many_attributes ||=[]

      @@has_many_models ||= []
      @@has_many_models << name

      attr_accessor name
      delegate :attributes=, to: name, prefix: true

      association :applicant_contact_details, ApplicantContactDetail

      define_method("build_#{name}") do
        main_model = instance_variable_get("@#{self.class.class_variable_get('@@main_model')}")
        main_model.public_send(name).build
      end

      define_method("#{name}_attributes=") do |attributes|
        main_model = instance_variable_get("@#{self.class.class_variable_get('@@main_model')}")

        attributes.each do |key, value|
          id = value.delete('id')
          if id.blank?
            main_model.public_send(name).build(value)
          else
            main_model.public_send(name).detect{|v| v.id.to_s == id.to_s}.assign_attributes(value)
          end
        end
      end
    end

  end

end
