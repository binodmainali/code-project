class EventsController < ApplicationController
  before_action :set_data, except: :index
  before_action :authenticate_user!, only: [:add_participant, :remove_participant]
  before_action :check_event_date, only: [:add_participant, :remove_participant]
  attr_accessor :event

  def index
    @events = Event.all.paginate(:page => params[:page], :per_page => 18)
  end

  def show
    @participants = User.where(id: EventParticipant.where(event_id: event.id, attending: true).pluck(:user_id))
    @already_subscribed = @participants.where(id: current_user.id).present? if current_user
  end

  def add_participant
    EventParticipant.create(event_id: event.id, user_id: current_user.id, attending: true)
    redirect_to event
  end

  def remove_participant
     EventParticipant.where(user_id: current_user.id, event_id: event.id).update(attending: false)
    redirect_to event
  end


  private

  def check_event_date
    if (event.end_date.blank? && event.start_date.to_date < Time.zone.now.to_date) || (event.end_date.present? && event.end_date < Time.zone.now.to_date)
      @past_event = true
      flash[:error] = "The event is already in past."
      redirect_to event and return
    end
  end

  def set_data
    @event = Event.find(params[:id])
  end
end
