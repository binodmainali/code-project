class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.timestamp :start_date
      t.timestamp :end_date
      t.string :location
      t.text :description
      t.timestamps
    end
  end
end
