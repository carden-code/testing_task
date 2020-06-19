class TodosController < ApplicationController
  def create
    @todo = find_project(params[:project_id]).todos.new(todo_params)
    if todo.save
      @todo = find_todo(todo.id)
      render json: @todo, status: 201
    else
      render json: { errors: @todo.errors }, status: :unprocessable_entity
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      redirect_to projects_path
    else
      render json: { errors: @todo.errors }, status: :unprocessable_entity
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:complited)
  end

  def find_project(project_id)
    Project.find(project_id)
  end

  def find_todo(id)
    Todo.select(:id, :text).where(id: id)
  end
end
