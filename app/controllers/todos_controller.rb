class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    if project_params
      project_new = Project.new(project_params)
      todo = project_new.todos.new(todo_params)
    else
      project = Project.find(params[:project_id])
      todo = project.todos.new(todo_params)
    end

    if todo.save
      render status: :created
    else
      render json: { errors: todo.errors }, status: :unprocessable_entity
    end
  end

  def update
    todo = Todo.find(params[:id])

    if todo.update(todo_params)
      render status: :ok
    else
      render json: { errors: todo.errors }, status: :unprocessable_entity
    end
  end

  private

  def todo_params
    params.require(:todos).permit(:text, :complited, :project_id)
  end

  def project_params
    params.require(:project).permit(:title)
  end
end
