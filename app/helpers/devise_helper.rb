module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

     html = <<-HTML
    <div class="alert alert-danger" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <i class="fa fa-times" aria-hidden="true"></i>
      </button> 
      <h2 class="text-xs-center">#{sentence}</h2>
      <ul class="list-red">#{messages}</ul>   
  </div>

    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end