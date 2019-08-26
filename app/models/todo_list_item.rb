class TodoListItem < ApplicationRecord
  #
  ## Associations
  #
  belongs_to :todo_list

  #
  ## Validations
  #
  validates(
    :title,
    presence: true
  )

  #
  ## Callbacks
  #
  after_save :update_todo_list_items

  #
  ## Method to update state of todo item list.
  #
  def complete
    update(completed: true)
  end

  private
    #
    ## After save we can update todo list state.
    #
    def update_todo_list_items
      todo_list.update_completed if completed && completed_changed?
    end
end
