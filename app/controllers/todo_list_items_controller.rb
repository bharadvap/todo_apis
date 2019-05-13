class TodoListItemsController < ApplicationController
  before_action :set_todo_list
  before_action(
    :set_todo_list_item,
    only: [
      :show,
      :update,
      :destroy,
      :complete
    ]
  )

  def index
    @iteams = @todo_list.todo_list_items
  end

  def show
  end

  def create
    @item = @todo_list.todo_list_items.new(todo_list_item_params)

    if @item.save
      render(
        :show,
        status: :created
      )
    else
      render(
        json: @item.errors,
        status: :unprocessable_entity
      )
    end
  end

  def update
    if @item.update(todo_list_item_params)
      render(
        :show,
        status: :ok
      )
    else
      render(
        json: @item.errors,
        status: :unprocessable_entity
      )
    end
  end

  def destroy
    @item.destroy
  end

  def complete
    @item.complete
  end

  private
    def set_todo_list_item
      @item = @todo_list.todo_list_items.find_by_id(params[:id])
      render json: { messge: "List item Record not found." }, status: 404 if @item.blank?
    end

    def set_todo_list
      @todo_list = TodoList.find_by_id(params[:todo_list_id])
      render json: { messge: "List Record not found." }, status: 404 if @todo_list.blank?
    end

    def todo_list_item_params
      params.require(
        :todo_list_item
      ).permit(
        :todo_list_id,
        :title
      )
    end
end
