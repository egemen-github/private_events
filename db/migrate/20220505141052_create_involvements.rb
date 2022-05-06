class CreateInvolvements < ActiveRecord::Migration[7.0]
  def change
    create_table :involvements do |t|
      t.integer :attendee_id
      t.integer :event_id

      t.timestamps
    end
  end
end
