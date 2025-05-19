class Api::ApiSessionsController < Devise::SessionsController
  respond_to :json
  before_action :drop_session_cookie

  private

  def drop_session_cookie
    request.session_options[:skip] = true
  end
end
