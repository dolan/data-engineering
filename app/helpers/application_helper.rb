module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def friendly_time(date_time)
    return date_time.to_time.getlocal.strftime("%l:%M %p") unless date_time.blank?
    ""
  end


  def friendly_date(date_time)
    return l(date_time.to_time.getlocal.to_date) unless date_time.blank?
    ""
  end


  def friendly_date_and_time(date_time)
    return friendly_date(date_time) + " " + friendly_time(date_time) unless date_time.blank?
    ""
  end
end
