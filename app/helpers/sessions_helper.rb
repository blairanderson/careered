module SessionsHelper

  def api_user
    @api_user ||= token && ApiKey.active.where(access_token: token).first.try(:user)
  end

  def token
    @auth ||= request.headers["HTTP_AUTHORIZATION"]
    @bearer ||= @auth.present? ? @auth.split.last : false
  end

end

