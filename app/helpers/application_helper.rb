module ApplicationHelper
  def flash_message(msg_type)
    %Q(<p class="#{msg_type}">#{flash[msg_type]}</p>).html_safe
  end

  def delete_link_to(label, url)
    link_to label, url, class: 'destroy btn', method: "delete", data: { confirm: '確認刪除?!'}
  end
end