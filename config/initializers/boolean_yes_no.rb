require 'i18n'

class TrueClass
  def humanize
    I18n.t "boolean.yes", :default => "Yes"
  end
end

class FalseClass
  def humanize
    I18n.t "boolean.no", :default => "No"
  end
end

class NilClass
  def humanize
    I18n.t "boolean.no", :default => "No"
  end
end
