class BaseForm
  include ActiveModel::Model

  ## REQUIRED BY COCOON ##
  def self.reflect_on_association(association)
  end

  def self.association association, klass
    @@attributes ||= {}
    @@attributes[association] = klass
  end

end
