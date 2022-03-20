json.extract! reminder_list, :id, :id, :description, :date, :isDone, :isOverDue, :created_at, :updated_at
json.url reminder_list_url(reminder_list, format: :json)
