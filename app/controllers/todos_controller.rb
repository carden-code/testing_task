class TodosController < ApplicationController
  before_action :find_projects

  def create
    if params.include? 'title'
      project_new = Project.new(project_params)
      todo = project_new.todos.new(todo_params)
    else
      project = Project.find(params[:project_id])
      todo = project.todos.new(todo_params)
    end

    if todo.save
      render 'projects/index', status: :created
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

  def find_projects
    @projects = Project.all
  end

  def todo_params
    params.permit(:text, :complited, :project_id)
  end

  def project_params
    params.permit(:title)
  end
end
