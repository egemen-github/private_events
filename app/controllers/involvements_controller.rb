class InvolvementsController < ApplicationController
  before_action :authenticate_user!
  def create
    # @involvement = current_user.involvements.build(involvement_params)
    @involvement = Involvement.new(involvement_params)

    if @involvement.save
      @event = Event.find(@involvement.event_id)
      flash[:notice] = "You are now joining to the #{@event.title} event."
      redirect_to your_events_path
    end
  end

  def destroy
    @involvement = Involvement.find(params[:id])
    @involvement.destroy

    @event = Event.find(@involvement.event_id)
    flash[:alert] = "You are no longer joining to the #{@event.title} event."
    redirect_to your_events_path
  end

  private

  def involvement_params
    params.require(:involvement).permit(:attendee_id, :event_id)
  end
end