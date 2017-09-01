class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    date_time = DateTime.parse([params[:event][:start_date], params[:event][:start_time]].join(' '))
    # date_time = params[:event][:start_date] + params[:event][:start_time]
    @event.date_time = date_time
    @event.admin = current_admin
    if @event.save
      if current_admin.events.closed.any?
        current_admin.events.most_recent.guests.each do |guest|
          Invite.create(guest: guest, event: @event)
        end
      end
      redirect_to event_invites_path(@event)
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  private
    def event_params
      params.require(:event).permit(:name, :location, :description)
    end
end
