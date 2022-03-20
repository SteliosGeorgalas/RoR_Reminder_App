class CreateReminderLists < ActiveRecord::Migration[5.2]
  def change
    create_table :reminder_lists do |t|
      t.integer :unique_id
      t.string :description
      t.datetime :date
      t.boolean :isDone, default: false
      t.boolean :isOverDue, default: false

      t.timestamps
    end
  end
end
