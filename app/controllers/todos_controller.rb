class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :find_todo, only: :update
  before_action :find_project, only: :create

  def create
    if params.include? 'title'
      project_new = Project.new(project_params)
      todo = project_new.todos.new(todo_params)
    else
      todo = @project.todos.new(todo_params)
    end

    if todo.save
      redirect_to projects_path, status: 201
    else
      render json: { errors: todo.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @todo.update(todo_params)
      redirect_to projects_path, status: :ok
    else
      render json: { errors: todo.errors }, status: :unprocessable_entity
    end
  end

  private

  def todo_params
    params.permit(:text, :complited, :project_id)
  end

  def project_params
    params.permit(:title)
  end

  def find_todo
    @todo = Todo.find(params[:id])
  end

  def find_project
    @project = Project.find(params[:project_id])
  end
end
