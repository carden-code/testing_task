class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    project = find_project(params[:project_id])
    todo = project.todos.new(todo_params_new)

    if todo.save
      redirect_to root_path, status: 201
    else
      render json: { errors: todo.errors }, status: :unprocessable_entity
    end
  end

  def update
    todo = Todo.find(params[:id])

    if todo.update(todo_params_compliited)
      redirect_to root_path, status: :ok
    else
      render json: { errors: todo.errors }, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.permit(:title)
  end

  def todo_params_compliited
    params.permit(:id, :complited)
  end

  def todo_params_new
    params.permit(:text, :complited, :project_id)
  end

  def find_project(project_id)
    Project.find(project_id)
  end
end
