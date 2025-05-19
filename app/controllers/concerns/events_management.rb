module EventsManagement extend ActiveSupport::Concern
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.expect(event: [ :title, :description, :location, :date, :user_id ])
    end

    def check_ownership
      return if current_user == @event.user
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
end
