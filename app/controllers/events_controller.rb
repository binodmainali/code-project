class EventsController < ApplicationController
  before_action :set_data, only: :show
  before_action :authenticate_user!, only: :subscribe_unsubscribe
  attr_accessor :id

  def index
    @events = Event.all.paginate(:page => params[:page], :per_page => 18)
  end

  def show
    @event = Event.find(id)
    @participants = User.where(id: EventParticipant.where(event_id: @event.id).pluck(:user_id))
    @already_subscribed = @participants.where(id: current_user.id).present? if current_user
  end

  def subscribe_unsubscribe
    x = 1
  end

  private

  def set_data
    @id = params[:id]
  end
end
