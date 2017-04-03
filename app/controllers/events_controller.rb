class EventsController < ApplicationController
  include ApplicationHelper
  before_action :logged_in_user, only: [:create, :new]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "event created!"
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @users = @event.attendees
  end

  def index
    @future_events = Event.future
    @past_events = Event.past
  end

  private

    def event_params
      params.require(:event).permit(:name, :location, :date, :creator_id)
    end

    def logged_in_user
      if current_user.nil?
        flash[:message] = "Please log in to create an event."
        redirect_to login_url
      end
    end
end
