class CreateEventPricings < ActiveRecord::Migration[6.0]
  def change
    create_table :event_pricings do |t|

      t.timestamps
    end
  end
end
