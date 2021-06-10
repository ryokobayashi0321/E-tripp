module DeviseHelper
  def devise_error_messages!
    return [] if resource.errors.empty?

    html = []
    resource.errors.full_messages.each do |errmsg|
      html += <<-TEXT
      <div class="alert alert-danger alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">close</span></button>
        <p>#{errmsg}</p></div>
      TEXT
    end
    html.html_safe(:p, errmsg)
  end

  def devise_error_messages?
    !resource.errors.empty?
  end
end
