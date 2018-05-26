module UrlHelper
  def url_without_parameters url
    url.split('?').first
  end
end
