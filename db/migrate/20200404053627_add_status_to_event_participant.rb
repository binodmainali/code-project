class AddStatusToEventParticipant < ActiveRecord::Migration[6.0]
  def change
    add_column :event_participants, :attending, :boolean
  end
end
