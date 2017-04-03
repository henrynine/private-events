class AddAttendeeIdToAttendance < ActiveRecord::Migration[5.0]
  def change
    add_column :attendances, :attendee_id, :integer
  end
end
