class TodosController < ApplicationController
  def create
    if find_project(params[:project_id]).id.present?
      todo = find_project(params[:project_id]).todos.new(todo_new_params)
    else
      project = Project.new(project_params)
      todo = project.todos.new(todo_new_params)
    end

    if todo.save
      render 'projects/index', status: 201
    else
      render json: { errors: todo.errors }, status: :unprocessable_entity
    end
  end

  def update
    todo = Todo.find(params[:id])

    if todo.update(todo_params)
      render 'projects/index', status: :ok
    else
      render json: { errors: todo.errors }, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project_id).permit(:title)
  end

  def todo_new_params
    params.require(:todo).permit(:text, :complited)
  end

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
