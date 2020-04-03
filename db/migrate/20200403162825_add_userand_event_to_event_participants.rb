class AddUserandEventToEventParticipants < ActiveRecord::Migration[6.0]
  def change
    add_column :event_participants, :user_id, :integer
    add_column :event_participants, :event_id, :integer
  end
end
