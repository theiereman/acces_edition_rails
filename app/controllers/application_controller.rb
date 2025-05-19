class ApplicationController < ActionController::Base
  include Pagy::Backend

  protect_from_forgery unless: -> { request.format.json? }

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
