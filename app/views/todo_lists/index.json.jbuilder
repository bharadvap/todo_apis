json.todo_lists @todo_lists do |todo_list|
  json.partial! todo_list, as: :todo_list
end
json.page @page
json.size @size
