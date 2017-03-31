class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :date
      t.integer :host_id

      t.timestamps
    end
  end
end
