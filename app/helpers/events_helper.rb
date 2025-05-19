module EventsHelper
  def has_ownership
    current_user == @event.user
  end
end
