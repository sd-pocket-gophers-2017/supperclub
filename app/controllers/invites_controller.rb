class InvitesController < ApplicationController
  before_action :find_event

  def index
    @invites = Invite.all.where(event: @event)
    invited_guests = @invites.map { |invt| invt.guest }
    @not_invited = (current_admin.guests - invited_guests).uniq
  end

  def create
    @guest = Guest.find(params[:id])
    Invite.create(guest: @guest, event: @event)
    redirect_to event_invites_path(@event)
  end

  def destroy
    Invite.find(params[:id]).destroy
    redirect_to event_invites_path(@event)
  end

  private
    def find_event
      @event = Event.find(params[:event_id])
    end

    def invite_params
      params.require(:invite).permit(:guest)
    end
end
