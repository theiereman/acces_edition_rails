
class Api::EventsController < ApplicationController
  include EventsManagement

  before_action :authenticate_user!
  respond_to :json

  before_action :set_event, only: %i[ update destroy ]
  before_action :check_ownership, only: %i[ update destroy ]

  # GET /api/v1/events
  def index
    @pagy, @events = pagy(Event.all)
    render json: { events: @events, pagination: @pagy }
  end

  # POST /api/v1/events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/events/1
  def destroy
    @event.destroy!

    head :no_content
  end
end
