class ProjectsController < ApplicationController
  # Возможно в будущем добавить пагинации.
  def index
    @projects = Project.all
  end
end
