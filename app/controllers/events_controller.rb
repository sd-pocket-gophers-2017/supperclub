class EventsController < ApplicationController
  before_action :require_login, except: [:present]
  before_action :require_event_admin, only: [:show, :edit, :update, :delete]
  # should only be visible to Admins
  # (should only show current admins events)
  def index
    @events = current_admin.events
  end

  # (should only show if logged in and current user is event admin
  def show
    @event = Event.find(params[:id])
  end

  #only if logged in
  def new
    @event = Event.new
  end

  # only if logged in
  def create
    @event = Event.new(event_params)
    if params[:event][:start_date] == '' || params[:event][:start_date] == ''
      @event.errors.add( :base, 'Must include start date and time')
      render 'new'
      return
    else
      date_time = DateTime.parse([params[:event][:start_date], params[:event][:start_time]].join(' '))
    end
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

  # only if logged in and current user is event admin
  def edit
    @event = Event.find(params[:id])
  end

  # only if logged in and current user is event admin
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  # only if logged in and current user is event admin
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  def present
    @event = Event.find_by(token: params[:id])
  end

  private
    def event_params
      params.require(:event).permit(:name, :location, :description)
    end

    def require_login
      unless admin_signed_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_admin_session_path # halts request cycle
      end
    end

    def require_event_admin
      @event = Event.find(params[:id])
      unless @event.admin_id == current_admin.id
        flash[:error] = "You must be event admin to access this section"
        redirect_to new_admin_session_path # halts request cycle
      end
    end
end
