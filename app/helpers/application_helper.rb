module ApplicationHelper
  def app_data
    as_html_data(
      view: javascript_view_name,
      environment: Rails.env
    )
  end

  def as_html_data(hash)
    data = {}
    hash.each do |k, v|
      data["data-#{k.to_s.tr('_', '-')}"] = v
    end
    data
  end

  def javascript_view_name
    action = get_action_name
    @javascript_view_name ||= "#{controller_path.camelcase.gsub('::', '_')}.#{action}View"
  end

  def css_class_name
    action = get_action_name
    controller_name = controller_path.underscore.gsub('::', '-').tr('_', '-').tr('/', '-')
    @css_class_name ||= "#{controller_name} body-#{controller_name}-#{action.underscore}"
  end

  def get_action_name
    action = action_name
    case action
    when 'update'
      'Edit'
    when 'create'
      'New'
    else
      action.camelcase
    end
  end

  def bootstrap_class_for(flash_type)
    string_for(flash_type)[:class]
  end

  def flash_icon_for(flash_type)
    string_for(flash_type)[:icon]
  end

  def active_link?(link_controller_name)
    controller_name == link_controller_name ? 'active' : ''
  end

  private

  def string_for(flash_type)
    case flash_type.to_sym
    when :success, :notice
      { icon: 'check', class: 'alert-success' }
    when :error, :alert
      { icon: 'ban', class: 'alert-danger' }
    when :info
      { icon: 'info', class: 'alert-info' }
    else
      { icon: 'warning', class: 'alert-warning' }
    end
  end
end
