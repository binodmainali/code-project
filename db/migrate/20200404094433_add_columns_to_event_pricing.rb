class AddColumnsToEventPricing < ActiveRecord::Migration[6.0]
  def change
    add_column :event_pricings, :price, :float
    add_column :event_pricings, :event_id, :integer, index: true
  end
end
