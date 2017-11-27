module ApplicationHelper
  # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "Gyojir's Page"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def current_user
    @current_user ||= User.find_by(ip_address: request.remote_ip)
    @current_user ||= User.create(ip_address: request.remote_ip)
    return @current_user
  end
end
