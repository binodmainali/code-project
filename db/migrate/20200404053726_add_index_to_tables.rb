class AddIndexToTables < ActiveRecord::Migration[6.0]
  def change
    add_index :event_participants, :event_id
    add_index :event_participants, [:user_id, :event_id]
  end
end
