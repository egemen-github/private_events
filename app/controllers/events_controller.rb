class EventsController < ApplicationController
  before_action :require_login, except: [:index]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def your
    @events = Event.all
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to @event
      flash[:success] = 'Great! Your event has been created!'
    else
      render :new, status: :unprocessable_entity
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
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to your_events_path, status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date, :time)
  end

  def require_login
    unless current_user
      flash[:error] = 'You must be logged in first.'
      redirect_to new_user_session_path
    end
  end
end
