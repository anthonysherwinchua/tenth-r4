module AdminHelper
  def breadcrumb_name(name)
    name || controller_name.humanize
  end
end
