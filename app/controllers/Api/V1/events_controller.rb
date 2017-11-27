class Api::V1::EventsController < ApplicationController

  def index
    events = Event.all
    render json: events
  end

  def create
    event = Event.create(event_params)
    user = User.find(params[:user_id])
    user.events << event
    render json: event
  end

  def show
    event = Event.find_by(id: params[:id])
    render json: event
  end

  def destroy
    event = Event.find_by(id: params[:id])
    event.destroy
    render json: event
  end

  def get_active_client_events
    userId = params[:user_id]
    events = Event.all
    activeClientsEvents = events.map do |event|
      if event.user_id == userId
        event
      end
    end
    activeClientsEventsCompacted = activeClientsEvents.compact
    render json: activeClientsEventsCompacted
  end

  private

  def event_params
    params.require(:event).permit(:title, :allDay, :start, :end, :category, :user_id)
  end

end
