class BaseForm

  include ActiveModel::Model

  include BaseForms::MainModel
  include BaseForms::HasOne
  include BaseForms::HasMany

end
