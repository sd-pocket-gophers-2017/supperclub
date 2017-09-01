class GuestsController < ApplicationController
  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      Invite.create(event: Event.find(params[:event_id]), guest: @guest)
      redirect_to event_invites_path
    else
      render 'new'
    end
  end

  private
    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :phone, :email)
    end
end
